import 'dart:developer';

import 'package:demo_spotify/screens/auth/login/login_screen.dart';
import 'package:demo_spotify/screens/search/search_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    return Material(
      child: Center(
          child: StreamBuilder<Auth?>(
        stream: auth.authStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            log('cargando');
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            log('AuthCheckScreen: ${snapshot.error}');
            return Center(child: Text('$snapshot.error'));
          }

          final auth = snapshot.data;

          log('${auth?.accessToken}');

          if (auth == null) {
            return const LoginScreen();
          }

          return const SearchScreen();
        },
      )),
    );
  }
}
