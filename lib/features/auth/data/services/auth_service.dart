import 'package:dartz/dartz.dart';

import 'package:flutter_clean_arch_bloc/core/models/failure.dart';
import 'package:flutter_clean_arch_bloc/core/modules/network/service_api.dart';

import '../dtos/user_dto.dart';

abstract class AuthService {
  Future<Either<Failure, UserDTO>> login(String username, String password);
  Future<Either<Failure, UserDTO>> signup(UserDTO user);
}

class AuthServiceImpl implements AuthService {
  final ServiceApi serviceApi;

  AuthServiceImpl({required this.serviceApi});

  @override
  Future<Either<Failure, UserDTO>> login(
      String username, String password) async {
    try {
      final response = await serviceApi.post("auth/login", data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        return Right(UserDTO.fromJson(response.data));
      }

      return Left(ApiFailure(response.data["message"]));
    } catch (e) {
      final error = serviceApi.fromError(e);

      if (error) {
        return Left(ApiFailure(e.toString()));
      }

      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDTO>> signup(UserDTO user) async {
    try {
      final response = await serviceApi.post("user", data: user);

      if (response.statusCode == 200) {
        return Right(UserDTO.fromJson(response.data));
      }

      return Left(ApiFailure(response.data["message"]));
    } catch (e) {
      final error = serviceApi.fromError(e);

      if (error) {
        return Left(ApiFailure(e.toString()));
      }

      return Left(Exception(e.toString()));
    }
  }
}
