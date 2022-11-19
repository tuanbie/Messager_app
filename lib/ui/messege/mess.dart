import 'package:flutter/material.dart';
import 'package:messager_app/constants.dart';
import 'package:messager_app/ui/messege/account.dart';
import 'package:messager_app/ui/messege/mess_list.dart';

class mess extends StatefulWidget {
  const mess({super.key});

  @override
  State<mess> createState() => _messState();
}

class _messState extends State<mess> {
  int _curentindex = 0;
  final tabs = [
    mess_list(),
    account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_curentindex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 18,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: msecon,
              size: 25,
            ),
            label: 'Messeger',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: msecon,
              size: 25,
            ),
            label: 'Setting',
          ),
        ],
        currentIndex: _curentindex,
        onTap: (index) {
          setState(() {
            _curentindex = index;
          });
        },
      ),
    );
  }
}
