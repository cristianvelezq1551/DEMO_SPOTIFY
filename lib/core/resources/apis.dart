class Api {
  static final Api _singleton = Api._internal();

  factory Api() {
    return _singleton;
  }

  Api._internal();

  static const String baseUrlAuthorize = 'https://accounts.spotify.com';
  static const String baseUrlSpotify = 'https://api.spotify.com/v1';
}
