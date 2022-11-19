import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:messager_app/controller/info/info_bloc.dart';
import 'package:messager_app/controller/info/info_state.dart';
import 'package:messager_app/ui/components/lable.dart';
import 'package:messager_app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messager_app/ui/components/image_loading.dart';

import '../../controller/info/info_event.dart';
import '../../controller/perferences.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  File? image;
  late InfoBloc infoBloc;

  @override
  void initState() {
    infoBloc = BlocProvider.of<InfoBloc>(context);

    super.initState();
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kContentColorLightTheme,
          title: const Text(
            "Setting",
            style: TextStyle(
                color: mblack, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: BlocListener<InfoBloc, InfoState>(
          listener: (context, state) {
            if (state is InfoSuccessState) {
              Navigator.pushNamed(context, 'acc');
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        ClipOval(
                          child: image != null
                              ? Image.file(
                                  image!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : const Image(
                                  image: AssetImage("assets/img/account.png"),
                                  height: 100,
                                  width: 100,
                                ),
                        ),
                        Positioned(
                            bottom: 20.0,
                            right: 20.0,
                            child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    context: context,
                                    builder: ((builder) => buttomshet()),
                                  );
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: mlight),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: mblack,
                                    size: 14,
                                  ),
                                )))
                      ],
                    ),
                    Text(
                      "Tuấn Bie",
                      style: TextStyle(
                          color: mblack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 50, 25, 0),
                      decoration: BoxDecoration(
                        color: mlight,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              infoBloc.add(InfoButtonPressd());
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
                              child: imega_load(
                                  title: "Thông tin",
                                  press: () {},
                                  Icons: Icons.people),
                            ),
                          ),
                          Divider(
                            thickness: 0.6,
                            indent: 60,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
                              child: imega_load(
                                  title: "Đăng xuất",
                                  press: () {},
                                  Icons: Icons.output_rounded),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget buttomshet() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        // color: kPrimarycurluColor,
      ),
      child: Column(children: <Widget>[
        Container(
          height: 5,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: msecon,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                pickImage(ImageSource.camera);
              },
              child: imega_load(
                title: "Camera",
                press: () {},
                Icons: Icons.camera,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                pickImage(ImageSource.gallery);
              },
              child: imega_load(
                title: "Gallery",
                press: () {},
                Icons: Icons.library_add,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
