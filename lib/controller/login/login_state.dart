import 'package:equatable/equatable.dart';
import 'package:messager_app/models/user.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {
  final String message;
  LoginLoadingState({required this.message});
}

class UserLoginSuccessState extends LoginState {
  final User user;
  UserLoginSuccessState({required this.user});
}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
}
