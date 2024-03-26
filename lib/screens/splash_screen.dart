import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/utils/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/theme.dart';
import 'homescreen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen().animate().fadeIn(duration: 1500.ms)),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
        final theme = ref.watch(themeNotifierProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HAB', style: headline1(context))
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .moveY(delay: 500.ms, begin: 10, duration: 2000.ms),
                const SizedBox(width: 10),
                Text('IT', style: headline1(context))
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .moveY(
                      duration: 2000.ms,
                      delay: 500.ms,
                    ),
              ],
            ),
            LoadingAnimationWidget.halfTriangleDot(
                    color: theme.isDarkModeOn? Colors.white:Colors.black, size: 24)
                .animate()
                .fadeIn(delay: 2200.ms, duration:500.ms),
                const SizedBox(height:15),
            SizedBox(width: size.width*0.7,
              child: const Text(
                "'Let today be the day you give up who you've been for who you can become.'\n-Hal Elrod", textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 3000.ms,duration: 1500.ms)
            ),
          ],
        ),
      ),
    ).animate().fadeOut(delay:7000.ms,duration: 3000.ms);
  }
}
