import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_arch_bloc/core/service_locator.dart';

import '../../domain/models/user_model.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final AuthUseCase _authUseCase;

  AuthBloc() : super(AuthInitial()) {
    _authUseCase = serviceLocator<AuthUseCase>();
    //Events
    on<OnClickLogin>(_onlogin);
    on<OnClickLogout>(_onlogout);
    on<OnClickSignUp>(_onSignUp);

    //check if the user is logged in
    on<WhenLoadingScreen>(_whenLoadingScreen);
    add(WhenLoadingScreen());
  }

  void _onlogin(OnClickLogin event, emit) async {
    emit(AuthLoading());

    final response = await _authUseCase.login(event.username, event.password);

    await Future.delayed(const Duration(milliseconds: 1000));

    response.fold(
      (error) => emit(AuthError(error.message)),
      (user) => emit(AuthLoaded(user)),
    );
  }

  void _onlogout(_, emit) async {
    await _authUseCase.logout();
    emit(AuthNotLoaded());
  }

  void _onSignUp(OnClickSignUp event, emit) async {
    emit(AuthLoading());

    UserModel userModel = UserModel(
      username: event.username,
      password: event.password,
    );

    final response = await _authUseCase.signup(userModel);

    await Future.delayed(const Duration(milliseconds: 1000));

    response.fold(
      (error) => emit(AuthError(error.message)),
      (user) => emit(AuthLoaded(user)),
    );
  }

  void _whenLoadingScreen(WhenLoadingScreen event, emit) async {
    final user = await _authUseCase.getUserLocalData();

    await Future.delayed(const Duration(milliseconds: 1000));

    if (user == null) {
      emit(AuthNotLoaded());
    } else {
      emit(AuthLoaded(user));
    }
  }
}
