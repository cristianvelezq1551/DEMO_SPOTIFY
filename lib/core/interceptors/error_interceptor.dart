import 'dart:developer';

import 'package:demo_spotify/core/dependency_injector/dependency_injector.dart';
import 'package:infrastructure/infrastructure.dart';

import '../../screens/auth/auth_controller.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Aquí puedes manejar los errores de las solicitudes
    // Puedes realizar acciones como mostrar un diálogo de error, redirigir a una página de error, etc.

    if (err.response != null) {
      // Error de respuesta del servidor
      log('Status code error dio: ${err.response!.statusCode}');
      log('Status code error dio: ${err.response?.data}');

      ///Usuario no autorizado o token expirado
      if (err.response!.statusCode == 401) {
        log('Error: JWTExpireException');

        ///Auth controller
        final authController = DependencyInjector().getIt<AuthController>();
        await authController.logout();
        return;
      }

      ///Error desconocido
      log('Error: UnknowException');

      super.onError(err, handler);
    } else {
      log('DisconnectException: ${err.error}');

      ///Error de conexión
      // throw DisconnectException();
      super.onError(err, handler);
    }
  }
}
