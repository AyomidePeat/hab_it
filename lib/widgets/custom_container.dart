import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../utils/theme.dart';

class CustomContainer extends ConsumerWidget {
  final double width;
  final double height;
  final Widget child;
  const CustomContainer({super.key, required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context, ref) {
      final theme = ref.watch(themeNotifierProvider);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:theme.isDarkModeOn?Color.fromARGB(66, 79, 79, 86): Color.fromARGB(26, 162, 25, 25)
      ),
      child:child
    );
  }
}
