import 'package:dio/dio.dart';

/// [QueuedRequest] is a container for requests that are suspended
/// while a token refresh is in progress.
class QueuedRequest {
  final DioException err;
  final ErrorInterceptorHandler handler;
  final RequestOptions options;

  QueuedRequest({required this.err, required this.handler, required this.options});
}
