import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/habit_model.dart';

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List<Habit>>((ref) {
  return HabitStateNotifier();
});

class HabitStateNotifier extends StateNotifier<List<Habit>> {
  HabitStateNotifier() : super([]);

  void addHabit(Habit habit) async {
    state = [...state, habit];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habitStrings =
        state.map((habit) => json.encode(habit.toJson())).toList();
    await prefs.setStringList('habits', habitStrings);
    
  }
   Future<List<Habit>> getHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habitStrings = prefs.getStringList('habits') ?? [];
    return habitStrings
        .map((habitString) => Habit.fromJson(json.decode(habitString)))
        .toList();
  }

  // addCompletedDay(int habitIndex, day) {
  //   final habit = state[habitIndex];
  //   final updatedHabit = habit.copyWith(
  //     completedDays: {
  //       ...habit.completedDays,
  //       day: true,
  //     },
  //   );
  //   state = [...state];
  //   state[habitIndex] = updatedHabit;
  // }

  // List<DateTime> getCompletedDaysForHabit(int habitIndex) {
  //   final habit = state[habitIndex];
  //   return habit.completedDays.entries
  //       .where((entry) => entry.value)
  //       .map((entry) => entry.key)
  //       .toList();
  // }
}
