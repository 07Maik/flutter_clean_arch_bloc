import 'package:dartz/dartz.dart';

import 'package:flutter_clean_arch_bloc/services/user_preferences.dart';
import 'package:flutter_clean_arch_bloc/core/models/failure.dart';

import '../models/user_model.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;
  final UserPreferences userPreferences;

  AuthUseCase({required this.authRepository, required this.userPreferences});

  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    final response = await authRepository.login(username, password);

    if (response.isRight()) {
      final remoteUser = response.getOrElse(() => UserModel());

      await userPreferences.saveUser(remoteUser);
    }

    return response;
  }

  Future<bool> logout() async => await userPreferences.deleteUser();

  Future<Either<Failure, UserModel>> signup(UserModel user) async {
    final response = await authRepository.signup(user);

    if (response.isRight()) {
      final remoteUser = response.getOrElse(() => UserModel());

      await userPreferences.saveUser(remoteUser);
    }

    return response;
  }

  Future<UserModel?> getUserLocalData() async =>
      await userPreferences.getUser();
}
