import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class TestNotifications extends StatefulWidget {
  const TestNotifications({super.key});

  @override
  State<TestNotifications> createState() => _TestNotificationsState();
}

class _TestNotificationsState extends State<TestNotifications> {
   var flutterLocalNotificationsPlugin;
  Future<void> showNotification() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
   
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
  );
   var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
   
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'Notification Title',
    'Notification Body',
    platformChannelSpecifics,
  );
}
   
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
  onPressed: showNotification,
  child: Text('Show Notification'),
),),
    );
  }
}