import 'package:flutter/material.dart';
import 'package:messager_app/components/text.dart';

class mess extends StatefulWidget {
  const mess({super.key});

  @override
  State<mess> createState() => _messState();
}

class _messState extends State<mess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: text(title: "hello")),
      ),
    );
  }
}
