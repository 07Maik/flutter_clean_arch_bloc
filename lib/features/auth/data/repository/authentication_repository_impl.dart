import 'package:dartz/dartz.dart';

import 'package:flutter_clean_arch_bloc/core/models/failure.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repository/auth_repository.dart';
import '../dtos/user_dto.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    final result = await authService.login(username, password);

    return result.fold(
      (error) => Left(error),
      (user) {
        final userModel = user.toEntity();
        return Right(userModel);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> signup(UserModel user) async {
    final userDTO = UserDTO.fromEntity(user);

    final result = await authService.signup(userDTO);

    return result.fold(
      (error) => Left(error),
      (user) {
        final userModel = user.toEntity();
        return Right(userModel);
      },
    );
  }
}
