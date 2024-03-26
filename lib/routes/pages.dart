import 'package:demo_spotify/routes/routes.dart';
import 'package:demo_spotify/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/auth/auth_screen.dart';

abstract class Pages {
  static Map<String, Widget Function(BuildContext)> routes = {
    MyRoutes.initial: (_) => const AuthScreen(),
    MyRoutes.login: (_) => const LoginScreen(),
  };
}
