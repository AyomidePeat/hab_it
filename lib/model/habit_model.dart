import 'dart:ui';

class Habit {
  final String habitName;
  final  reminderText;
  final Color color;
  final  icon;

  Habit(
      {required this.habitName,
      required this.reminderText,
      required this.color,
      required this.icon});

      Habit copyWith({String? habitName, String? reminderText, Color? color, String? icon}){
        return Habit(habitName: habitName??this.habitName, reminderText: reminderText?? this.reminderText, color: color??this.color, icon: icon??this.icon);
      }
     
}


