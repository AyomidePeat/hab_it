import 'package:flutter/material.dart';

class StreakContainer extends StatelessWidget {
  final Color color;
  final bool isCompleted;
  final int day;

  const StreakContainer(
      {super.key,
      required this.color,
      required this.isCompleted,
      required this.day,
     
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 2,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    );
  }
}
