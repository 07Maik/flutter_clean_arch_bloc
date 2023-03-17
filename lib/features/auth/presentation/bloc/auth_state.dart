part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthNotLoaded extends AuthState {}

class AuthLoaded extends AuthState {
  final UserModel user;

  AuthLoaded(this.user);

  @override
  List<Object?> get props => [user];
}
