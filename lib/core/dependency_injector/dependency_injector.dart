import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';

import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';
import '../resources/apis.dart';

class DependencyInjector {
  static final DependencyInjector _singleton = DependencyInjector._internal();

  factory DependencyInjector() {
    return _singleton;
  }

  DependencyInjector._internal();

  final GetIt getIt = GetIt.instance;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: Api.baseUrlSpotify,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  ));

  final Dio _dioAuthorize = Dio(BaseOptions(
    baseUrl: Api.baseUrlAuthorize,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  ));

  final _storage = const FlutterSecureStorage();

  Future<void> setup() async {
    final AuthlocalRepositoryImpl authLocalRepositoryImpl =
        AuthlocalRepositoryImpl(AuthLocalService(storage: _storage));

    // Auth repository
    final authRepositoryImpl = AuthRemoteRepositoryImpl(
      authDataSource: AuthService(
        dio: _dioAuthorize,
        authLocalRepositoryImpl: authLocalRepositoryImpl,
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(
          authLocalRepositoryImpl: authLocalRepositoryImpl,
          authRemoteRepositoryImpl: authRepositoryImpl),
      ErrorInterceptor(),
    ]);

    final searchRepositoryImpl = SearchRepositoryImpl(
      SearchService(
        dio: _dio,
      ),
    );

    getIt.registerSingleton<AuthUseCase>(
        AuthUseCase(authRemoteRepository: authRepositoryImpl));

    getIt.registerSingleton<SearchUseCase>(
        SearchUseCase(searchRepository: searchRepositoryImpl));
  }
}
