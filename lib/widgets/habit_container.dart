import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/utils/textstyle.dart';
import 'package:hab_it/widgets/streak_widget.dart';

class HabitContainer extends ConsumerWidget {
  final String habitName;
  final String icon;
  final Color color;
  final String frequency;
  final onPressed;
  final reminderText;
  final Color lightColor;
  final bool isCompleted;
  const HabitContainer( {
    super.key,
    required this.habitName,
    required this.lightColor,
    required this.isCompleted,
    required this.icon,
    required this.reminderText,
    required this.color,
    required this.frequency,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10.0),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 79, 79, 86)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: color),
                        child: Center(
                          child: SvgPicture.asset(
                            icon,
                            color: Colors.white,
                            fit: BoxFit.contain,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              habitName,
                              overflow: TextOverflow.ellipsis,
                              style: bodyText1(context),
                            ),
                          ),
                        ),
                        Text(
                          ' $frequency',
                          style: bodyText3(context),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 42,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted ? color : lightColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Icon(Icons.check),
                  ),
                )
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 320, maxHeight: 40),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 15,
                    mainAxisExtent: 15,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 5),
                children: [
                  for (int i = 0; i <= 30; i++)
                    StreakContainer(
                        color: isCompleted ? color : lightColor,
                        isCompleted: isCompleted)
                ],
              ),
            )
          ],
        ));
  }
}
