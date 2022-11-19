import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/ui/components/iconlogin.dart';
import 'package:messager_app/ui/components/leble_image.dart';
import 'package:messager_app/ui/components/text.dart';
import 'package:messager_app/ui/components/textfeld.dart';

import 'package:messager_app/constants.dart';
import 'package:messager_app/controller/register/register_bloc.dart';

import '../components/button.dart';
import '../../controller/register/register_envent.dart';
import '../../controller/register/register_state.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController number = TextEditingController();

  late RegisterBloc registerBloc;

  @override
  void initState() {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  final msg =
      BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
    if (state is RegisterErrorState) {
      return Text(
        state.message,
        style: TextStyle(color: kPrimarycurluColor),
      );
    } else if (state is RegisterLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is UserRegisterSuccessState) {
            Navigator.pushNamed(context, 'login');
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    image(context),
                    const text(title: "Register"),
                  ],
                ),
              ),
              msg,
              textform(controller: email, hintText: 'Email'),
              textform(controller: pass, hintText: "PassWord"),
              textform(controller: username, hintText: 'UserName'),
              textform(controller: number, hintText: "NumberPhone"),
              DefaultButton(
                press: () {
                  registerBloc.add(RegisterButtonPressd(
                      email: email.text,
                      password: pass.text,
                      username: username.text,
                      number: number.text));
                },
                text: "Continue",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'or',
                      style: TextStyle(
                        color: msecon,
                        fontSize: 15,
                      ),
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
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'login');
                    //   },
                    //   child: const Text(
                    //     ' Login',
                    //     style: TextStyle(
                    //       color: kPrimarycurluColor,
                    //     ),
                    //   ),
                    // ),
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
