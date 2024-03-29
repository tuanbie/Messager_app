import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String username;
  String email;
  String? photoUrl;
  String number;
  String? is_active;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.photoUrl,
    required this.number,
    this.is_active,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        photoUrl: json["urlimage"],
        number: json["number"],
        is_active: json["is_active"],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'urlimage': is_active,
        'number': number,
        'is_active': is_active,
      };

  // @override
  // bool operator ==(Object other) => other is User && other.id == id;

  // @override
  // int get hashCode => id.hashCode;
}
