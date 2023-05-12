import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/habit_model.dart';

final habitStateNotifierProvider = StateNotifierProvider<HabitStateNotifier, List<Habit>>((ref){
  return HabitStateNotifier();
});
class HabitStateNotifier extends StateNotifier<List<Habit>> {
  HabitStateNotifier() : super([]);

  void addHabit(Habit habit) {
  state = [...state, habit];
 
  }
}
