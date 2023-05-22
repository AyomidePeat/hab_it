import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/utils/textstyle.dart';
import 'package:hab_it/widgets/streak_widget.dart';

import '../model/habit_model.dart';

class HabitContainer extends ConsumerWidget {
  final Habit habit;
  final VoidCallback onPressed;
  final int currentDay;

  HabitContainer({
    super.key,
    required this.habit,
    required this.onPressed,
    required this.currentDay,
  });

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10.0),
        height: 150,
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
                            color: habit.color),
                        child: Center(
                          child: SvgPicture.asset(
                            habit.icon,
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
                              habit.habitName,
                              overflow: TextOverflow.ellipsis,
                              style: bodyText1(context),
                            ),
                          ),
                        ),
                        Text(
                          ' ${habit.frequency}',
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
                        backgroundColor:
                            habit.isCompleted ? habit.color : habit.lightColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Icon(Icons.check),
                  ),
                )
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320, maxHeight: 60),
              child: GridView(scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(), addAutomaticKeepAlives:true ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisExtent: 10,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                children: [
                  for (int i = 1; i <=10000 ; i++)
                    StreakContainer(
                      color: habit.isCompleted && i + 1 == currentDay
                          ? habit.color
                          : habit.lightColor,
                      isCompleted: habit.completedDays.containsKey(i+1) ,
                   
                    )
                ],
              ),
            )
          ],
        ));
  }
}
