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
      yield LoginLoadingState(message: "Lỗi từ nguồn dữ liệu!");
      var data = await authRepo.login(event.email, event.password);
      if (data != null) {
        // pref.setString("token", data['token']);
        // pref.setString("email", data['email']);
        yield UserLoginSuccessState();
      } else {
        yield LoginErrorState(message: "Dữ liệu đăng nhập không đúng !");
      }
    }
  }
}
