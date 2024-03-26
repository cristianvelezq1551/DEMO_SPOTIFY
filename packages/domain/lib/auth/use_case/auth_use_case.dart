part of domain;

class AuthUseCase {
  final AuthRemoteRepository _authRemoteRepository;

  AuthUseCase({required AuthRemoteRepository authRemoteRepository})
      : _authRemoteRepository = authRemoteRepository;

  Future<String?> authenticate() => _authRemoteRepository.authenticate();

  Future<Auth> getToken({required String code}) =>
      _authRemoteRepository.getToken(code: code);

  Future<Auth> refreshToken() => _authRemoteRepository.refreshToken();

  Future<Auth?> currentAuth() => _authRemoteRepository.currentAuth();

  Future<void> logout() => _authRemoteRepository.logout();
}
