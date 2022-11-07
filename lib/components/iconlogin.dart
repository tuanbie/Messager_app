import 'package:flutter/material.dart';
import 'package:messager_app/ui/constants.dart';

class iconlogin extends StatelessWidget {
  const iconlogin({
    Key? key,
    this.press,
    this.Icons,
  }) : super(key: key);
  final Icons;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: press as void Function()?,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            // margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryDartColor),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: Icon(
              Icons!,
              size: 15,
              color: kPrimaryDartColor,
            ),
          ),
        ),
      ),
    );
  }
}
