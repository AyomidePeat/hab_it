import 'dart:ui';

class Habit {
  final int id;
  static int idCounter = 0;
  final String habitName;
  String? reminderText;
  final Color color;
  final String icon;
  final frequency;
  final Color lightColor;
  bool isCompleted;
  final Map<DateTime, bool> completedDays;

  Habit(
      {required this.habitName,
      this.reminderText,
      required this.color,
      required this.icon,
      required this.frequency,
      this.isCompleted = false,
      required this.lightColor,
      this.completedDays = const {}})
      : id = idCounter++;

  Habit copyWith(
      {String? habitName,
      String? reminderText,
      Color? color,
      String? icon,
      var frequency,
      bool? completed,
      String? id,
      Color? lightColor,
      Map<DateTime, bool>? completedDays}) {
    return Habit(
        habitName: habitName ?? this.habitName,
        completedDays: completedDays ?? this.completedDays,
        reminderText: reminderText ?? this.reminderText,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        frequency: frequency ?? this.frequency,
        lightColor: lightColor ?? this.lightColor);
  }

  void markAsCompleted() {
    isCompleted = true;
  }
}
