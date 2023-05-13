import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/theme.dart';

class HabitContainer extends ConsumerWidget {
  final String habitName;
  final String icon;
  final Color color;
  final String frequency;
  final reminderText;
  const HabitContainer({
    super.key,
    required this.habitName,
    required this.icon,
    required this.reminderText,
    required this.color,
    required this.frequency,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeNotifierProvider);
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(20.0),
        height: 102,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 79, 79, 86)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 35,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                      child: Center(
                        child: SvgPicture.asset(
                          icon,
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$habitName',
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                Text(
                  ' $frequency',
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            Text(reminderText),
          ],
        ));
  }
}
