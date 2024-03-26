import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';

class AuthInterceptor extends Interceptor {
  final AuthlocalRepositoryImpl authLocalRepositoryImpl;
  final AuthRemoteRepositoryImpl authRemoteRepositoryImpl;

  AuthInterceptor(
      {required this.authLocalRepositoryImpl,
      required this.authRemoteRepositoryImpl});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == '/auth/refresh') {
      handler.next(options);
      return;
    }

    ///get token from local storage
    Auth? auth = await authLocalRepositoryImpl.getAuth();

    if (auth != null && auth.accessToken != null) {
      ///Valido el token
      // final accessTokenIsValid = await authLocalRepositoryImpl.validateToken();

      log("ENTRANDO EN ${options.path}");
      // log("EL TOKEN ES VALIDO? => $accessTokenIsValid");

      // ///Si no es válido, lo refresco
      // if (!accessTokenIsValid) {
      //   try {
      //     await authRemoteRepositoryImpl.refreshToken();
      //     auth = await authLocalRepositoryImpl.getAuth();
      //   } catch (e) {
      //     super.onRequest(options, handler);
      //   }
      // }

      ///Lo agrego al header
      options.headers['Authorization'] = 'Bearer ${auth.accessToken}';
    }

    super.onRequest(options, handler);
  }
}
