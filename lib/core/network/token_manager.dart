import 'package:dartz/dartz.dart';
import 'package:tarombo/core/error/failures.dart';

/// [TokenManager] defines the contract for handling authentication tokens.
/// This allows the networking layer to be independent of the auth implementation.
abstract class TokenManager {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<Either<Failure, String>> refreshAccessToken();
  Future<void> clearTokens();
}
