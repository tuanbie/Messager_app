import 'dart:convert';

Info userFromJson(String str) => Info.fromJson(json.decode(str));

String userToJson(Info data) => json.encode(data.toJson());

class Info {
  int id;
  String username;
  String email;
  String? photoUrl;
  String number;
  String? is_active;

  Info({
    required this.id,
    required this.username,
    required this.email,
    this.photoUrl,
    required this.number,
    this.is_active,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
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
