import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/screens/homescreen.dart';
import 'package:hab_it/screens/splash_screen.dart';


import 'package:hab_it/utils/theme.dart';

void main() {

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
   
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,  ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: theme.getTheme(),
      home: const SplashScreen(),
    );
     
  }
}
