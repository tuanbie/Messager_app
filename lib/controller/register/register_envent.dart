import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterEvent {}

class RegisterButtonPressd extends RegisterEvent {
  final String email;
  // bool get isValidUsername => email.isNotEmpty;
  final String password;
  // bool get isValidPassword => password.length >= 5;
  final String username;
  final String number;
  RegisterButtonPressd({
    required this.email,
    required this.password,
    required this.username,
    required this.number,
  });
}
