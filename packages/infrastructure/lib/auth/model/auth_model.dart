part of infrastructure;

class AuthModel extends Auth {
  AuthModel(
      {required super.accessToken,
      required super.tokenType,
      required super.expiresIn,
      required super.refreshToken,
      required super.scope});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
      };
}
