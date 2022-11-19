import 'package:flutter/material.dart';
import '../../constants.dart';

class textform extends StatelessWidget {
  const textform({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimarycurluColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimarycurluColor),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hintText,
          // border: InputBorder.none,
          // filled: true,
          // suffixIcon: IconButton(
          //   icon: Icon(Icons.clear),
          //   onPressed: () async => _textControllor.clear(),
          // ),
        ),
        // validator: (value) => null,
      ),
    );
  }
}
