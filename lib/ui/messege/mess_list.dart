import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager_app/ui/components/leble_image.dart';
import 'package:messager_app/constants.dart';

import '../../controller/login/login_bloc.dart';
import 'components/list_active.dart';

class mess_list extends StatefulWidget {
  const mess_list({super.key});

  @override
  State<mess_list> createState() => _mess_listState();
}

class _mess_listState extends State<mess_list> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kContentColorLightTheme,
          elevation: 0,
          title: const Text(
            'Messenger',
            style: TextStyle(
              color: mblack,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Container(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    // ? Image.file(
                    //     image!,
                    //     width: 100,
                    //     height: 100,
                    //     fit: BoxFit.cover,
                    //   )
                    // :
                    AssetImage("assets/img/account.png"),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kContentColorLightTheme),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),
              list_active(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    user(context),
                    user(context),
                    user(context),
                    user(context),
                    user(context),
                    user(context),
                    user(context),
                    user(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
