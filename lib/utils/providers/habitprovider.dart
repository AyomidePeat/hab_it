import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/habit_model.dart';
import '../../widgets/habit_container.dart';

final HabitStateNotifierProvider = StateNotifierProvider<HabitStateNotifier, List<Habit>>((ref){
  return HabitStateNotifier();
});
class HabitStateNotifier extends StateNotifier<List<Habit>> {
  HabitStateNotifier() : super([]);

  void addHabit(Habit habit) {
   print('Current state: $state');
  state = [...state, habit];
  print('New state: $state');
  }
}
