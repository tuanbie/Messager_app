import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/components/iconlogin.dart';
import 'package:messager_app/components/leble_image.dart';
import 'package:messager_app/components/text.dart';
import 'package:messager_app/components/textfeld.dart';
import 'package:messager_app/components/textpass.dart';
import 'package:messager_app/controller/login/login_bloc.dart';
import 'package:messager_app/controller/login/login_state.dart';
import 'package:messager_app/ui/constants.dart';

import '../../components/button.dart';

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
      return Text(state.message);
    } else if (state is LoginLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
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
            return; //Navigator.pushNamed(context, '/mess');
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimarycurluColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                    filled: true,
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.clear),
                    //   onPressed: () async => _textControllor.clear(),
                    // ),
                  ),
                  validator: (value) => null,
                ),
              ),
              // textform(
              //   key: null,
              // ),
              textformpass(
                key: null,
              ),
              DefaultButton(
                text: 'Continue',
                press: () {
                  // loginBloc.add(
                  //     LoginButtonPressd(email: email.text, password: pass.text));
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'or',
                      style: TextStyle(
                        color: kSecondaryColor,
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
                    SizedBox(
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
                    Text(
                      'Do not have an account?',
                      style: TextStyle(
                        color: kPrimaryDartColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Register',
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
