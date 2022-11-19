import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';

class textformpass extends StatelessWidget {
  const textformpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimarycurluColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: "Pass",
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
