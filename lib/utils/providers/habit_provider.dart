import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/habit_model.dart';

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List<Habit>>((ref) {
  return HabitStateNotifier();
});

class HabitStateNotifier extends StateNotifier<List<Habit>> {
  HabitStateNotifier() : super([]);

  void addHabit(Habit habit) {
    state = [...state, habit];
  }

  addCompletedDay(int habitIndex,  day) {
    final habit = state[habitIndex];
    final updatedHabit = habit.copyWith(
      completedDays: {
        ...habit.completedDays,
        day: true,
      },
    );
    state = [...state];
    state[habitIndex] = updatedHabit;

   
  }

  List<DateTime> getCompletedDaysForHabit(int habitIndex) {
  final habit = state[habitIndex];
  return habit.completedDays. entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}

}
