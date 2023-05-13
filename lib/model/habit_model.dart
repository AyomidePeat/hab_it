import 'dart:ui';

class Habit {
  final String habitName;
  String? reminderText;
  final Color color;
  final String icon;
  final frequency;

  Habit(
      {required this.habitName,
      this.reminderText,
      required this.color,
      required this.icon,
      required this.frequency,  });

  Habit copyWith(
      {String? habitName, String? reminderText, Color? color, String? icon, var frequency}) {
    return Habit(
        habitName: habitName ?? this.habitName,
        reminderText: reminderText ?? this.reminderText,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        frequency: frequency??this.frequency);
  }
}
