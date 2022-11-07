import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvent {}

class LoginButtonPressd extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressd({required this.email, required this.password});
}

// abstract class LoginEvent {}

// class LoginUsernameChanged extends LoginEvent {
//   final String username;

//   LoginUsernameChanged({required this.username});
// }

// class LoginPasswordChanged extends LoginEvent {
//   final String password;

//   LoginPasswordChanged({required this.password});
// }

// class LoginSubmitted extends LoginEvent {}
