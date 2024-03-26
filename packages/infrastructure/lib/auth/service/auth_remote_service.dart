part of infrastructure;

class AuthService extends AuthRemoteDataSource {
  final Dio _dio;
  final AuthlocalRepositoryImpl _authLocalRepositoryImpl;
  AuthService(
      {required Dio dio,
      required AuthlocalRepositoryImpl authLocalRepositoryImpl})
      : _dio = dio,
        _authLocalRepositoryImpl = authLocalRepositoryImpl;

  final String clientId = "c0a0e4f55cb641349f4c4b52b474954c";
  final String callbackUrlScheme = "valid-callback-scheme";
  final String redirectUri = "valid-callback-scheme:/";

  @override
  Future<String?> authenticate() async {
    const String scope = "playlist-read-private playlist-read-collaborative";
    const String codeChallengeMethod = 'S256';
    String codeVerifier = '';
    String codeChallenge = '';

    codeVerifier = randomAlphaNumeric(44);
    Uint8List bytes = utf8.encode(codeVerifier);
    Digest digest = sha256.convert(bytes);
    codeChallenge = base64UrlEncode(digest.bytes);

    if (codeChallenge.endsWith('=')) {
      codeChallenge = codeChallenge.substring(0, codeChallenge.length - 1);
    }

    final authorizationUrl =
        'https://accounts.spotify.com/authorize?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&scope=$scope&code_challenge_method=$codeChallengeMethod&code_challenge=$codeChallenge';

    try {
      final response = await FlutterWebAuth.authenticate(
        url: authorizationUrl,
        callbackUrlScheme: callbackUrlScheme,
      );

      final code = Uri.parse(response).queryParameters['code'];
      _authLocalRepositoryImpl.saveCodeChallenge(code: codeVerifier);
      log('SAVE codeVerifier => $codeVerifier');

      return code;
    } catch (e) {
      log('Error de autenticación: $e');
    }
    return null;
  }

  @override
  Future<Auth> getToken({required String code}) async {
    final codeVerifier = await _authLocalRepositoryImpl.getCodeChallenge();
    try {
      final response = await _dio.post(
        '/api/token',
        data: {
          'grant_type': "authorization_code",
          'code': code,
          'redirect_uri': redirectUri,
          'client_id': clientId,
          'code_verifier': codeVerifier
        },
        options: Options(
          headers: {
            'content-type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      final auth = AuthModel.fromJson(response.data);
      await _authLocalRepositoryImpl.saveAuth(auth: auth);

      return auth;
    } on DioException catch (e) {
      log('getToken =>$e');
      rethrow;
    }
  }

  @override
  Future<Auth?> currentAuth() => _authLocalRepositoryImpl.getAuth();

  @override
  Future<void> logout() => _authLocalRepositoryImpl.deleteAuth();

  @override
  Future<Auth> refreshToken() async {
    final getAuth = await _authLocalRepositoryImpl.getAuth();
    try {
      final response = await _dio.post(
        '/api/token',
        data: {
          'grant_type': 'refresh_token',
          'refresh_token': getAuth?.refreshToken,
          'client_id': clientId
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      final auth = AuthModel.fromJson(response.data);
      await _authLocalRepositoryImpl.saveAuth(auth: auth);

      return auth;
    } on DioException catch (e) {
      log('refreshToken => $e');
      rethrow;
    }
  }
}
