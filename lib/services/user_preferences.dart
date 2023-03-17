import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_clean_arch_bloc/core/service_locator.dart';

import 'package:flutter_clean_arch_bloc/features/auth/domain/models/user_model.dart';

const String keyCache = "userPreferences";

class UserPreferences {
  UserModel? _user;
  UserModel? get user => _user;

  UserPreferences() {
    getUser();
  }

  SharedPreferences? get sharedPrefs => serviceLocator<SharedPreferences>();

  Future<bool> saveUser(UserModel user) async {
    final map = user.toJson();

    bool saved = await sharedPrefs!.setString(keyCache, jsonEncode(map));

    if (saved) _user = user;

    return saved;
  }

  Future<UserModel?> getUser() async {
    String? userMap = sharedPrefs!.getString(keyCache);

    if (userMap == null) return null;

    _user = UserModel.fromJson(jsonDecode(userMap));

    return _user;
  }

  Future<bool> deleteUser() async {
    _user = null;
    return await sharedPrefs!.remove(keyCache);
  }
}
