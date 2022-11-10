import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  login(String email, String pass) async {
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
        return data;
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
