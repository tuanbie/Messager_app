import 'package:flutter/material.dart';
import 'package:messager_app/ui/components/text.dart';
import 'package:messager_app/ui/begin_form/login_form.dart';
import 'package:messager_app/constants.dart';
import '../components/leble_image.dart';
import '/constants.dart';
import '../../router/router.dart';

class wait_screen extends StatefulWidget {
  const wait_screen({super.key});

  @override
  State<wait_screen> createState() => _wait_screenState();
}

class _wait_screenState extends State<wait_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200)).then((value) {
      Navigator.pushNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image(context),
                  text(title: "Messenger"),
                ],
              )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 45),
                child: CircularProgressIndicator(
                  backgroundColor: mlight,
                  color: kPrimarycurluColor,
                  strokeWidth: 7,
                ),
              ),
            ]),
      ),
    );
  }
}
