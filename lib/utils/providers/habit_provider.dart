import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/habit_model.dart';

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List>((ref) {
  return HabitStateNotifier();
});

class HabitStateNotifier extends StateNotifier<List> {
  HabitStateNotifier() : super([]);

  void addHabit(Habit habit) async {
    state = [...state, habit];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? habitStrings = prefs.getStringList('habits');
    habitStrings ??= [];
    habitStrings.add(json.encode(habit.toJson()));

    await prefs.setStringList('habits', habitStrings);
  }
}
