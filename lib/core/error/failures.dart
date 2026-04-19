import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server Failure']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache Failure']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network Failure']);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = 'Connection Failure']);
}

class ValidationFailure extends Failure {
  final Map<String, dynamic>? errors;
  const ValidationFailure(super.message, {this.errors});

  @override
  List<Object?> get props => [message, errors];
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication Failure']);
}
