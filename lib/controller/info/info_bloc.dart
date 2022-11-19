import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/models/info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './info_event.dart';
import './info_state.dart';
import '../../reporitory/repository.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  GetuserbyIdrRepository authRepo;

  InfoBloc(InfoState initialState, this.authRepo) : super(initialState);

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    // Username updated
    var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield InfoInitState();
      // Password updated
    } else if (event is InfoButtonPressd) {
      String id = '';

      // id = await BaseSharedPreferences.getString('id');
      id = pref.getString('id') ?? '';
      // final int? id = pref.getInt("id");

      if (id == '') {
        yield InfoLoadingState(message: "Lỗi từ nguồn dữ liệu!");
      } else {
        var data = await GetuserbyIdrRepository.getuserID(int.parse(id));
        if (data != null) {
          // pref.setInt('id', data['id']);
          Info info = data;
          // pref.setString("email", data['email']);
          yield InfoSuccessState(info: data);
        } else {
          yield InfoErrorState(message: "Dữ liệu đăng nhập không đúng !");
        }
      }
    }
  }
}
