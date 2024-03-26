part of domain;

abstract class Auth {
  final String? accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String scope;

  Auth({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
  });
}
