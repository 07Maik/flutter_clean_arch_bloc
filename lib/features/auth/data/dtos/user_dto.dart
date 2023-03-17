import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/user_model.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();

  const factory UserDTO(
      {required String username,
      required String firstName,
      required String lastName,
      String? password,
      String? token}) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromEntity(UserModel userEntity) => UserDTO(
        username: userEntity.username,
        firstName: userEntity.firstName,
        lastName: userEntity.lastName,
        password: userEntity.password,
        token: userEntity.token,
      );

  UserModel toEntity() => UserModel(
        username: username,
        firstName: firstName,
        lastName: lastName,
        password: password,
        token: token,
      );
}
