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

  // void toggle(String habitId) {
  //   state = [
  //     for ( final habit in state)
  //       if (habit.id == habitId)
  //     habit.copyWith(completed: !habit.IScompleted)
  //     else habit,
  //   ];
  // }
}
