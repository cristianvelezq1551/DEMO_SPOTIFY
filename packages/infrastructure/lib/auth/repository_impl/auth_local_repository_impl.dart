part of infrastructure;

class AuthlocalRepositoryImpl extends AuthLocalRepository {
  final AuthLocalDataSource _authDataSource;

  AuthlocalRepositoryImpl(this._authDataSource);

  @override
  Future<void> deleteAuth() => _authDataSource.deleteAuth();

  @override
  Future<Auth?> getAuth() => _authDataSource.getAuth();

  @override
  Future<void> saveAuth({required Auth auth}) =>
      _authDataSource.saveAuth(auth: auth);

  @override
  Future<String?> getCodeChallenge() => _authDataSource.getCodeChallenge();

  @override
  Future<void> saveCodeChallenge({required String code}) =>
      _authDataSource.saveCodeChallenge(code: code);

  @override
  Future<bool> validateToken() => _authDataSource.validateToken();
}
