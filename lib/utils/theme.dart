import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final themeNotifierProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});

final lightTheme = ThemeData(fontFamily: 'nexa',
  brightness: Brightness.light,
  primaryColor: Colors.blueGrey,
  primarySwatch:Colors.blueGrey ,
   //  accentColor: Colors.blueGrey,
  scaffoldBackgroundColor: Color.fromARGB(255, 255, 247, 247 ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color:Colors.black),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Colors.black),
     displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
    bodyLarge: TextStyle(fontSize: 16,color:Colors.black),
    bodyMedium: TextStyle(fontSize: 14,color:Colors.black),
     bodySmall: TextStyle(fontSize: 12,color:Colors.black ),
  ),colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black), 
);

final darkTheme = ThemeData(fontFamily: 'nexa',
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,//colorScheme:  Colors.blueGrey,
  textTheme:  const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
   displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14, ),
    bodySmall: TextStyle(fontSize: 12, ),
  ), 
);

class ThemeNotifier extends ChangeNotifier {
  bool isDarkModeOn = true;

  final brightness = SchedulerBinding.instance.window.platformBrightness;
  
  ThemeData _themeData = darkTheme;
  ThemeData getTheme() => _themeData;

  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    _themeData = isDarkModeOn ? darkTheme : lightTheme;
    notifyListeners();
  }

  void syncThemeWithSystem() {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    isDarkModeOn = brightness == Brightness.dark;
    _themeData = isDarkModeOn ? darkTheme : lightTheme;
    notifyListeners();
  }
}
