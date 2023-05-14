import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/utils/textstyle.dart';

import '../utils/theme.dart';
import 'calendar_widget.dart';

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
        padding: const EdgeInsets.all(10.0),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 79, 79, 86)),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color:color),
        child: Center(
                        child: SvgPicture.asset(
                          icon,
                          color: Colors.white,
                          fit: BoxFit.contain,
                          height: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        habitName,
                        overflow: TextOverflow.fade,
                         style: bodyText1(context),
                      ),
                    ),
                  ],
                ),
                  Padding(
                      padding: const EdgeInsets.only(top:8.0),
                  child: Text(
                    ' $frequency',
                    overflow: TextOverflow.fade,
                    style: bodyText3(context),
                  ),
                ),
              ],
            ),
               CalenderWidget(color: color),
          ],
        ));
  }
}
