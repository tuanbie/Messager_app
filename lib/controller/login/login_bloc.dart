import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_avent.dart';
import './login_state.dart';
import '../../reporitory/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository authRepo;

  LoginBloc(LoginState initialState, this.authRepo) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    var pref = await SharedPreferences.getInstance();
    // Username updated
    if (event is StartEvent) {
      yield LoginInitState();

      // Password updated
    } else if (event is LoginButtonPressd) {
      yield LoginLoadingState();
      var data = await authRepo.login(event.email, event.password);
      if (data['email'] == event.email) {
        pref.setString("token", data['token']);
        pref.setString("email", data['email']);
        yield UserLoginSuccessState();
      } else {
        yield LoginErrorState(message: "Loi dang nhap");
      }
      // Form submitted
    } //else if (event is LoginSubmitted) {
    //   yield state.copyWith(formStatus: FormSubmitting());

    //   try {
    //     await authRepo.login();
    //     yield state.copyWith(formStatus: SubmissionSuccess());
    //   } catch (e) {
    //     yield state.copyWith(formStatus: SubmissionFailed(e));
    //   }
    // }
  }
}
