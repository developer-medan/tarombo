import 'package:dio/dio.dart';
import 'package:tarombo/core/error/exceptions.dart';
import 'package:tarombo/core/error/failures.dart';

class ErrorHandler {
  static Failure handleException(dynamic exception) {
    if (exception is DioException) {
      return _handleDioError(exception);
    } else if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is AuthException) {
      return AuthFailure(exception.message);
    } else if (exception is ValidationException) {
      return ValidationFailure(exception.message, errors: exception.errors);
    } else {
      return ServerFailure(exception.toString());
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ConnectionFailure('Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        if (statusCode == 401) {
          return const AuthFailure('Unauthorized access');
        } else if (statusCode == 422) {
          return ValidationFailure(data?['message'] ?? 'Validation error', errors: data?['errors']);
        }
        return ServerFailure(data?['message'] ?? 'Server error occurred');
      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled');
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return const NetworkFailure('Check your internet connection');
      default:
        return const ServerFailure('Something went wrong');
    }
  }
}
