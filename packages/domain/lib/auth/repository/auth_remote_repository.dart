part of domain;

abstract class AuthRemoteRepository {
  Future<String?> authenticate();

  Future<Auth> getToken({required String code});

  Future<Auth?> currentAuth();

  Future<void> logout();

  Future<Auth> refreshToken();
}
