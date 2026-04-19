class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException([super.message = 'Server Error', int? statusCode]) : super(statusCode: statusCode);
}

class CacheException extends AppException {
  CacheException([super.message = 'Cache Error']);
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network Error']);
}

class AuthException extends AppException {
  AuthException([super.message = 'Authentication Error']);
}

class ValidationException extends AppException {
  final Map<String, dynamic>? errors;
  ValidationException(super.message, {this.errors});
}
