// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class LocalNotificationService {
//   LocalNotificationService();

//   final _localNotificationService = FlutterLocalNotificationsPlugin();

//   Future<void> intialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@drawable/ic_stat_android');

//         IOSInitializationSettings iosInitializationSettings =
//         IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     await _localNotificationService.initialize(
//       settings,
//       onSelectNotification: onSelectNotification,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:messager_app/constants.dart';

class snackbar extends StatelessWidget {
  const snackbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
          color: kPrimarycurluColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Text(
              "Messenger",
              style: TextStyle(fontSize: 20),
            ),
            Text(title),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kPrimarycurluColor,
      elevation: 0,
    );
  }
}
