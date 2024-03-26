part of infrastructure;

class AuthRemoteRepositoryImpl extends AuthRemoteRepository {
  final AuthRemoteDataSource _authDataSource;

  AuthRemoteRepositoryImpl({required AuthRemoteDataSource authDataSource})
      : _authDataSource = authDataSource;
  @override
  Future<String?> authenticate() => _authDataSource.authenticate();

  @override
  Future<Auth> getToken({required String code}) =>
      _authDataSource.getToken(code: code);
  @override
  Future<Auth?> currentAuth() => _authDataSource.currentAuth();

  @override
  Future<Auth> refreshToken() => _authDataSource.refreshToken();

  @override
  Future<void> logout() => _authDataSource.logout();
}
