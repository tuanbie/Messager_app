import 'package:flutter/material.dart';
import '../ui/constants.dart';

class textform extends StatelessWidget {
  const textform({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimarycurluColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: null,
          border: InputBorder.none,
          filled: true,
          // suffixIcon: IconButton(
          //   icon: Icon(Icons.clear),
          //   onPressed: () async => _textControllor.clear(),
          // ),
        ),
        validator: (value) => null,
      ),
    );
  }
}
