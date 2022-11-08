import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  login(String email, String pass) async {
    var res = await http.post(Uri.http("http://localhost:3000/api/users"),
        headers: {}, body: {"email": email, "password": pass});
    final data = json.decode(res.body);
    if (data['email'] != null) {
      return data;
    } else {
      return "Login problem";
    }
    return;
  }
}

// class AuthRepository {
//   Future<void> login() async {
//     print('attempting login');
//     Future.delayed(Duration(seconds: 3));
//     print('logged in');
//     // throw Exception('failed log in');
//   }
// }
