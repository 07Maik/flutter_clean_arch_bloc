import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class Exception extends Failure {
  const Exception(String message) : super(message);
}

class DataBaseFailure extends Failure {
  const DataBaseFailure(String message) : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure(String message) : super(message);
}
