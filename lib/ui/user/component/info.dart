// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:messager_app/controller/info/info_bloc.dart';

// import '../../../controller/info/info_state.dart';

// class user extends StatefulWidget {
//   const user({super.key});

//   @override
//   State<user> createState() => _userState();
// }

// class _userState extends State<user> {
//   late InfoBloc infoBloc;

//   @override
//   void initState() {
//     infoBloc = BlocProvider.of<InfoBloc>(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BlocBuilder<InfoBloc, InfoState>(
//           builder: (context, state) => state is InfoSuccessState
//               ? Text(
//                   state.user.username,
//                   style: TextStyle(color: Colors.red),
//                 )
//               : Container()),
//     );
//   }
// }
