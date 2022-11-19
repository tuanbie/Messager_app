import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:messager_app/models/info.dart';
import 'package:messager_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  login(String email, String pass) async {
    // var pref = await SharedPreferences.getInstance();
    // int id;
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = pass;
    var res = await http.post(
      Uri.parse("http://localhost:3000/api/users/login"),
      headers: <String, String>{
        // 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: map,
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      if (data['success'] == 1) {
        // await pref.setString('id', data("id"));
        User user = User.fromJson(data['data']);
        return user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

class RegisterRepository {
  Register(String email, String pass, String username, String number) async {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = pass;
    map['username'] = username;
    map['number'] = number;
    var res = await http.post(
      Uri.parse("http://localhost:3000/api/users"),
      headers: {},
      body: map,
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      if (data['success'] == 1) {
        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

class GetuserbyIdrRepository {
  static getuserID(int id) async {
    var res = await http.get(
      Uri.parse("http://localhost:3000/api/users/${id}"),
      headers: {},
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      if (data['success'] == 1) {
        Info info = Info.fromJson(data['data']);
        return info;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
