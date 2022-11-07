class User {
  String? get id => _id;
  String? username;
  String? pass;
  String? photoUrl;
  String? _id;
  bool? active;
  DateTime? lastseen;

  User(
      {required this.username,
      required this.pass,
      this.photoUrl,
      this.active,
      this.lastseen});

  toJson() => {
        'username': username,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastseen
      };

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        username: json['username'],
        pass: json['pass'],
        photoUrl: json['photo_url'],
        active: json['active'],
        lastseen: json['last_seen']);
    user._id = json['id'];
    return user;
  }

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  @override
  int get hashCode => id.hashCode;
}



// import 'package:messager_app/models/repiect.dart';

// import 'message.dart';

// class LocalMessage {
//   String chatId;
//   String get id => _id;
//   String _id;
//   Message message;
//   ReceiptStatus receipt;

//   LocalMessage(this.chatId, this.message, this.receipt);

//   Map<String, dynamic> toMap() => {
//         'chat_id': chatId,
//         'id': message.id,
//         'sender': message.from,
//         'receiver': message.to,
//         'contents': message.contents,
//         'receipt': receipt.value(),
//         'received_at': message.timestamp.toString()
//       };

//   factory LocalMessage.fromMap(Map<String, dynamic> json) {
//     final message = Message(
//         from: json['sender'],
//         to: json['receiver'],
//         contents: json['contents'],
//         timestamp: DateTime.parse(json['received_at']));

//     final localMessage = LocalMessage(
//         json['chat_id'], message, EnumParsing.fromString(json['receipt']));
//     localMessage._id = json['id'];
//     return localMessage;
//   }
// }