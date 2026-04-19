import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tarombo/core/network/request_retry_handler.dart';

/// [DioLoggingInterceptor] provides a premium logging experience for Dio.
/// It includes request/response timings, formatted JSON, and visual indicators.
/// It also orchestrates retries and token refreshes via [NetworkRetryHandler].
class DioLoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0, errorMethodCount: 8, lineLength: 100, colors: true, printEmojis: true, dateTimeFormat: DateTimeFormat.none));

  final NetworkRetryHandler _retryHandler;
  final PackageInfo _packageInfo;
  final Stopwatch _stopwatch = Stopwatch();

  DioLoggingInterceptor(this._retryHandler, this._packageInfo);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _stopwatch.reset();
    _stopwatch.start();

    // Standard high-quality headers
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['X-App-Version'] = _packageInfo.version;
    options.headers['X-Platform'] = Platform.operatingSystem;
    options.headers['X-Platform-Version'] = Platform.operatingSystemVersion;

    _logger.i('🚀 REQUEST [${options.method}] => ${options.uri}');
    if (options.data != null) {
      _logger.d('📦 Data: ${_formatJson(options.data)}');
    }
    if (options.queryParameters.isNotEmpty) {
      _logger.d('🔍 Query Params: ${options.queryParameters}');
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _stopwatch.stop();
    final duration = _stopwatch.elapsedMilliseconds;

    _logger.i('✅ RESPONSE [${response.statusCode}] (${duration}ms) => ${response.requestOptions.uri}');
    _logger.d('📄 Data: ${_formatJson(response.data)}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _stopwatch.stop();
    final duration = _stopwatch.elapsedMilliseconds;

    _logger.e('❌ ERROR [${err.response?.statusCode}] (${duration}ms) => ${err.requestOptions.uri}');
    _logger.e('📝 Message: ${err.message}');
    if (err.response?.data != null) {
      _logger.d('💾 Error Data: ${_formatJson(err.response?.data)}');
    }

    // Orchestrate retry/refresh
    return _retryHandler.handleError(err, handler);
  }

  String _formatJson(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString();
    } catch (_) {
      return data.toString();
    }
  }
}
