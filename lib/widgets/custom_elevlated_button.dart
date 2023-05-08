import 'package:flutter/material.dart';
import 'package:hab_it/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final  child;
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.height,
      required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))  
     ), child: Center(child: child)),
    );
  }
}
