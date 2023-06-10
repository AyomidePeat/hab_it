import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/screens/splash_screen.dart';
import 'package:hab_it/test_notif.dart';
import 'package:hab_it/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
 null,
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  //Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);

runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String name = 'Awesome Notifications - Example App';
  static const Color mainColor = Colors.deepPurple;
  const MyApp({super.key});

   @override
  ConsumerState<MyApp> createState() => _MyAppConsumerState();
}

class _MyAppConsumerState extends ConsumerState<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
       
      debugShowCheckedModeBanner: false,
     
  
       
      title: 'Hab It',
      theme: theme.getTheme(),
      home:  SplashScreen(),
    );
  }
}


