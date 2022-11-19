import 'package:flutter/material.dart';

import '../../size_config.dart';

class lable extends StatelessWidget {
  const lable({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}
