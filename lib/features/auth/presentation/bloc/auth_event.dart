part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnClickLogin extends AuthEvent {
  final String username;
  final String password;

  OnClickLogin({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class OnClickLogout extends AuthEvent {}

class OnClickSignUp extends AuthEvent {
  final String username;
  final String password;

  OnClickSignUp(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class WhenLoadingScreen extends AuthEvent {}

class OnClick {}
