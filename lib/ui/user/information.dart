import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/constants.dart';
import 'package:messager_app/controller/login/login_bloc.dart';
import 'package:messager_app/controller/login/login_state.dart';

import '../../controller/info/info_bloc.dart';
import '../../controller/info/info_state.dart';
import '../../controller/login/login_avent.dart';

class acc extends StatefulWidget {
  const acc({super.key});

  @override
  State<acc> createState() => _accState();
}

class _accState extends State<acc> {
  late InfoBloc infoBloc;

  @override
  void initState() {
    infoBloc = BlocProvider.of<InfoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String test = ' test';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kContentColorLightTheme,
        title: const Text(
          "Information",
          style: TextStyle(
              color: mblack, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushNamed(context, 'acc');
          }
        },
        child: Container(
          child: BlocBuilder<InfoBloc, InfoState>(
            builder: (context, state) => state is InfoSuccessState
                ? Text(
                    state.info.username,
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
