import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './register_envent.dart';
import './register_state.dart';
import '../../reporitory/repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepository repository;
  RegisterBloc(RegisterState initialState, this.repository)
      : super(initialState);
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    var pref = await SharedPreferences.getInstance();
    // Username updated
    if (event is StartEvent) {
      yield RegisterInitState();
      // Password updated
    } else if (event is RegisterButtonPressd) {
      yield RegisterLoadingState();
      var data = await repository.Register(
          event.email, event.password, event.username, event.number);
      if (data != null) {
        // pref.setString("token", data['token']);
        // pref.setString("email", data['email']);
        yield UserRegisterSuccessState();
      } else {
        yield RegisterErrorState(message: "Dữ liệu đăng nhập không đúng !");
      }
    }
  }
}
