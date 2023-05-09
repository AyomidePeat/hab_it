import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hab_it/utils/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HAB', style: headline1(context))
                    .animate().fadeIn(duration: 500.ms)
                    .moveY(delay: 500.ms,begin:10, duration: 2000.ms),
                const SizedBox(width: 10),
                Text('IT', style: headline1(context))
                    .animate().fadeIn(duration: 500.ms)
                    .moveY(duration: 2000.ms, delay: 500.ms,),
              ],
            ),
            LoadingAnimationWidget.halfTriangleDot(
                color: Colors.black, size: 24).animate().fadeIn(delay:2100.ms),
          ],
        ),
      ),
    );
  }
}
