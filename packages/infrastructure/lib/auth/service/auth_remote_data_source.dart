part of infrastructure;

abstract class AuthRemoteDataSource {
  Future<String?> authenticate();

  Future<Auth> getToken({required String code});

  Future<Auth?> currentAuth();

  Future<Auth> refreshToken();

  Future<void> logout();
}
