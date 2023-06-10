import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Notifications Demo'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Send Notification'),
          onPressed: () {
            sendNotification();
          },
        ),
      ),
    );
  }
}

void sendNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'New Message',
      body: 'You have received a new message.',
    ),
  );
}
