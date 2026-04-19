import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tarombo/core/network/queued_request.dart';
import 'package:tarombo/core/network/token_manager.dart';

/// [NetworkRetryHandler] manages the retry logic and request queuing
/// during sensitive operations like token refreshing.
class NetworkRetryHandler {
  final Dio _dio;
  final TokenManager? _tokenManager;
  final List<QueuedRequest> _queue = [];
  bool _isRefreshing = false;

  NetworkRetryHandler(this._dio, [this._tokenManager]);

  /// Handles the error and decides whether to retry or queue the request.
  Future<void> handleError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    // Handle 401 Unauthorized - Refresh Token
    if (statusCode == 401 && _tokenManager != null) {
      return _handleTokenRefresh(err, handler);
    }

    // Handle other transient errors (Retry one time)
    if (_shouldRetry(err)) {
      try {
        final response = await _retry(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }

  Future<void> _handleTokenRefresh(DioException err, ErrorInterceptorHandler handler) async {
    _queue.add(QueuedRequest(err: err, handler: handler, options: err.requestOptions));

    if (_isRefreshing) return;

    _isRefreshing = true;
    try {
      final result = await _tokenManager!.refreshAccessToken();
      await result.fold(
        (failure) async {
          _rejectAll(err);
        },
        (newToken) async {
          await _retryAll(newToken);
        },
      );
    } finally {
      _isRefreshing = false;
      _queue.clear();
    }
  }

  Future<void> _retryAll(String newToken) async {
    for (final queued in _queue) {
      try {
        final options = queued.options;
        options.headers['Authorization'] = 'Bearer $newToken';
        final response = await _dio.fetch(options);
        queued.handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          queued.handler.next(e);
        } else {
          queued.handler.next(queued.err);
        }
      }
    }
  }

  void _rejectAll(DioException err) {
    for (final queued in _queue) {
      queued.handler.next(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return _dio.fetch(requestOptions);
  }
}
