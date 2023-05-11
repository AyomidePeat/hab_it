import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/theme.dart';

class HabitContainer extends ConsumerWidget {
  final habitName;
 final icon;
 final  Color color;
 final reminderText;
  const HabitContainer(
      { required this.habitName,
    required this.icon,
     required this.reminderText,
   required this.color
      });

  @override
  Widget build(BuildContext context, ref) {
    
    return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
           color: color
        ),
        child: Column(
          children: [
         // ...habitName,
         Text('$habitName', overflow: TextOverflow.fade,),
         SvgPicture.asset(icon),
          Text(reminderText),
          ],
        ));
  }
}
