import 'package:flutter/material.dart';
import 'package:messager_app/ui/components/text.dart';
import 'package:messager_app/constants.dart';

Widget image(BuildContext context) {
  return Container(
    child: Image(
        image: AssetImage('assets/icon/mess.png'), height: 200, width: 200),
  );
}

Widget aline(BuildContext context) {
  return Container(
    child: aline(context),
  );
}

Widget img(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/img/account.png"),
            ),
          ),
          Text(
            "data",
            style: TextStyle(color: mblack),
          )
        ],
      ),
    ),
  );
}

Widget user(BuildContext context) {
  return Container(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            height: 65,
            width: 65,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/img/account.png"),
            ),
          ),
        ),
        Text(
          "user1",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
