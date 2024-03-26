import 'dart:async';
import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dependency_injector/dependency_injector.dart';
import '../../messages/messages.dart';

class AuthController extends ChangeNotifier {
  final AuthUseCase _authUseCase;

  AuthController({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase {
    log('=============');
    log('AuthController init');
    getAuth();
    DependencyInjector().getIt.registerSingleton<AuthController>(this);
    log('=============');
  }

  final StreamController<Auth?> authStreamController =
      StreamController<Auth?>();

  Auth? _auth;
  Auth? get auth => _auth;
  String? _code;
  String? get code => _code;

  Future<Auth?> getAuth() async {
    _auth = await _authUseCase.currentAuth();
    authStreamController.add(_auth);

    return _auth;
  }

  Future<void> logout() async {
    _authUseCase.logout();
    _auth = null;
    authStreamController.add(null);
  }

  Future<void> authenticate(BuildContext context) async {
    Messages.showLoading(context);
    try {
      _code = await _authUseCase.authenticate();

      if (context.mounted) {
        getToken(context, code: _code!);
      }
    } catch (e) {}
  }

  Future<void> getToken(BuildContext context, {required String code}) async {
    try {
      _auth = await _authUseCase.getToken(code: code);

      if (context.mounted) {
        authStreamController.add(_auth);
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      log('getToken ==> $e');
    }
  }

  @override
  void dispose() {
    log('======================');
    authStreamController.close();
    DependencyInjector().getIt.unregister<AuthController>();
    log('AuthCheckController disposed');
    log('======================');
    super.dispose();
  }
}

final authControllerProvider = ChangeNotifierProvider.autoDispose(
  (ref) =>
      AuthController(authUseCase: DependencyInjector().getIt<AuthUseCase>()),
);
