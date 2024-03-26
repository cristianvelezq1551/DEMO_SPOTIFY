part of infrastructure;

class AuthLocalService extends AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  AuthLocalService({required FlutterSecureStorage storage})
      : _storage = storage;
  @override
  Future<void> deleteAuth() async {
    try {
      await _storage.delete(key: SharedKeyConstants.auth);
    } catch (e) {
      log('$e');
    }
  }

  @override
  Future<Auth?> getAuth() async {
    try {
      final auth = await _storage.read(key: SharedKeyConstants.auth);
      if (auth != null) {
        return AuthModel.fromJson(jsonDecode(auth));
      }
      return null;
    } catch (e) {
      await _storage.deleteAll();
    }
    return null;
  }

  @override
  Future<void> saveAuth({required Auth auth}) async {
    try {
      await _storage.write(
          key: SharedKeyConstants.auth,
          value: jsonEncode((auth as AuthModel).toJson()));
    } catch (e) {
      log('$e');
    }
  }

  @override
  Future<String?> getCodeChallenge() async {
    try {
      final code = await _storage.read(key: SharedKeyConstants.codeChallenge);
      if (code != null) {
        return jsonDecode(code);
      }
      return null;
    } catch (e) {
      await _storage.deleteAll();
    }
    return null;
  }

  @override
  Future<void> saveCodeChallenge({required String code}) async {
    try {
      await _storage.write(
          key: SharedKeyConstants.codeChallenge, value: jsonEncode(code));
    } catch (e) {
      log('$e');
    }
  }

  @override
  Future<bool> validateToken() async {
    ///Get user
    final auth = await getAuth();

    DateTime? expiryDate = Jwt.getExpiryDate(auth?.accessToken ?? '');

    if (expiryDate == null) return false;

    bool isCurrent = expiryDate.isAfter(DateTime.now());
    return isCurrent;
  }
}
