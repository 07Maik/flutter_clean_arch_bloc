import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_clean_arch_bloc/core/modules/network/service_api.dart';
import 'package:flutter_clean_arch_bloc/services/user_preferences.dart';

import 'package:flutter_clean_arch_bloc/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:flutter_clean_arch_bloc/features/auth/data/services/auth_service.dart';
import 'package:flutter_clean_arch_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_clean_arch_bloc/features/auth/domain/usecases/auth_usecase.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  await _config();
  _core();
  _features();
}

Future<void> _config() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
}

Future<void> _core() async {
  serviceLocator.registerLazySingleton(() => ServiceApi());
  serviceLocator.registerLazySingleton(() => UserPreferences());
}

Future<void> _features() async {
  //Auth

  serviceLocator.registerLazySingleton(() => AuthUseCase(
        authRepository: serviceLocator(),
        userPreferences: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authService: serviceLocator()));

  serviceLocator.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(serviceApi: serviceLocator()));
}
