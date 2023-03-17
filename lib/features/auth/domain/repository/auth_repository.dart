import 'package:dartz/dartz.dart';

import 'package:flutter_clean_arch_bloc/core/models/failure.dart';

import '../../data/dtos/user_dto.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login(String user, String password);

  Future<Either<Failure, UserModel>> signup(UserDTO user);
}
