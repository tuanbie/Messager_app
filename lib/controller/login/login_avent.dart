import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvent {}

class LoginButtonPressd extends LoginEvent {
  final String email;
  // bool get isValidUsername => email.isNotEmpty;
  final String password;
  // bool get isValidPassword => password.length >= 5;
  LoginButtonPressd({required this.email, required this.password});
}
