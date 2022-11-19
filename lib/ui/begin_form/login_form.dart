import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/ui/components/iconlogin.dart';
import 'package:messager_app/ui/components/leble_image.dart';
import 'package:messager_app/ui/components/notification.dart';
import 'package:messager_app/ui/components/text.dart';
import 'package:messager_app/ui/components/textfeld.dart';
import 'package:messager_app/controller/login/login_bloc.dart';
import 'package:messager_app/controller/login/login_state.dart';
import 'package:messager_app/constants.dart';

import '../components/button.dart';
import '../../controller/login/login_avent.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  final msg = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    if (state is LoginErrorState) {
      return Text(
        state.message,
        style: TextStyle(color: kPrimarycurluColor),
      );
      // snackbar(title: state.message);
    } else if (state is LoginLoadingState) {
      return Container();
      // snackbar(title: state.message);
    } else {
      return Container();
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushNamed(context, 'mess');
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 170, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    image(context),
                    const text(title: "Messeger"),
                  ],
                ),
              ),
              msg,
              textform(controller: email, hintText: 'Email'),
              textform(controller: pass, hintText: "PassWord"),
              DefaultButton(
                press: () {
                  loginBloc.add(LoginButtonPressd(
                      email: email.text, password: pass.text));
                },
                text: "Continue",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Row(
                  children: const [
                    Divider(
                      thickness: 10,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: msecon,
                        fontSize: 15,
                      ),
                    ),
                    Divider(
                      thickness: 10,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconlogin(
                      Icons: Icons.facebook,
                      press: () {},
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    iconlogin(
                      Icons: Icons.g_mobiledata,
                      press: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account?',
                      style: TextStyle(
                        color: kPrimaryDartColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(
                          color: kPrimarycurluColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
