import 'package:flutter/material.dart';

import '../utils/textstyle.dart';
import '../widgets/theme_button.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: headline1(context),
        ),
      ),
    );
  }
}
