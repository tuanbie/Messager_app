import 'package:flutter/material.dart';

import '../../components/leble_image.dart';

class list_active extends StatefulWidget {
  const list_active({super.key});

  @override
  State<list_active> createState() => _list_activeState();
}

class _list_activeState extends State<list_active> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            img(context),
            img(context),
            img(context),
            img(context),
            img(context),
            img(context),
            img(context),
            img(context),
          ],
        ),
      ),
    );
  }
}
