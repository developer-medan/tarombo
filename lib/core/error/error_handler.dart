import 'package:dio/dio.dart';
import 'package:tarombo/core/error/exceptions.dart';
import 'package:tarombo/core/error/failures.dart';

/// [FailureMapper] provides an ergonomic way to convert exceptions into failures.
/// It uses Dart extensions to allow `exception.toFailure()` calls.
extension FailureMapper on Object {
  Failure toFailure() {
    final exception = this;

    return switch (exception) {
      DioException() => _handleDioError(exception),
      ServerException() => ServerFailure(exception.message),
      CacheException() => CacheFailure(exception.message),
      AuthException() => AuthFailure(exception.message),
      ValidationException() => ValidationFailure(exception.message, errors: exception.errors),
      Failure() => exception, // Already a failure
      _ => ServerFailure(toString()),
    };
  }

  Failure _handleDioError(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout || DioExceptionType.sendTimeout || DioExceptionType.receiveTimeout => const ConnectionFailure('Connection timeout'),

      DioExceptionType.badResponse => _mapBadResponse(error),

      DioExceptionType.cancel => const ServerFailure('Request cancelled'),

      DioExceptionType.connectionError || DioExceptionType.unknown => const NetworkFailure('Check your internet connection'),

      _ => const ServerFailure('Something went wrong'),
    };
  }

  Failure _mapBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    return switch (statusCode) {
      401 => const AuthFailure('Unauthorized access'),
      422 => ValidationFailure(data?['message'] ?? 'Validation error', errors: data?['errors']),
      _ => ServerFailure(data?['message'] ?? 'Server error occurred'),
    };
  }
}
