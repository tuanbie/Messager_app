import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
}



// import 'package:messager_app/controller/login/submiss_status.dart';

// class LoginState {
//   final String username;
//   // bool get isValidUsername => username.length > 3;
//   final String password;
//   // bool get isValidPassword => password.length > 6;
//   final FormSubmissionStatus formStatus;

//   LoginState({
//     this.username = '',
//     this.password = '',
//     this.formStatus = const InitialFormStatus(),
//   });

//   LoginState copyWith({
//     String? username,
//     String? password,
//     FormSubmissionStatus? formStatus,
//   }) {
//     return LoginState(
//         username: username ?? this.username,
//         password: password ?? this.password,
//         formStatus: formStatus ?? this.formStatus);
//   }
// }
