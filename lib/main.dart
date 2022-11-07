import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/controller/login/login_bloc.dart';
import 'package:messager_app/controller/login/login_state.dart';
import 'package:messager_app/reporitory/repository.dart';
import 'package:messager_app/router/router.dart';
import 'package:messager_app/ui/begin_form/login_form.dart';
import 'package:messager_app/ui/begin_form/wait_screen.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:messager_app/ui/constants.dart';
import 'package:messager_app/ui/messege/mess.dart';
import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(LoginInitState(), LoginRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        // darkTheme: darkThemeData(context),
        debugShowMaterialGrid: false, // home: FirstScreen(),
        // initialRoute: RoutesClass.getFirstScreen(),
        // // theme: ThemeData(backgroundColor: Colors.cyan),
        // getPages: RoutesClass.routes,
        routes: {
          '/': (context) => wait_screen(),
          'login': (context) => login(),
          'mess': (context) => mess(),
        },
      ),
    );
  }
}
