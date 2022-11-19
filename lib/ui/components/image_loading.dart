import 'package:flutter/material.dart';
import 'package:messager_app/ui/components/text.dart';
import 'package:messager_app/constants.dart';

class imega_load extends StatelessWidget {
  const imega_load({
    Key? key,
    required this.title,
    required this.press,
    required this.Icons,
  }) : super(key: key);

  final String title;
  final Function? press;
  final Icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            press as void Function()?;
          },
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: msecon,
                ),
                child: Icon(
                  Icons,
                  color: kPrimaryDartColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
