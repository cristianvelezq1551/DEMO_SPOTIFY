part of domain;

abstract class AuthLocalRepository {
  Future<void> deleteAuth();

  Future<void> saveAuth({required Auth auth});

  Future<Auth?> getAuth();

  Future<void> saveCodeChallenge({required String code});

  Future<String?> getCodeChallenge();

  //Validate token
  Future<bool> validateToken();
}
