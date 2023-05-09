import 'package:flutter_riverpod/flutter_riverpod.dart';

final iconStateProvider = StateNotifierProvider<IconStateNotifier, List<bool>>((ref) {
  return IconStateNotifier();
});

class IconStateNotifier extends StateNotifier<List<bool>> {
  IconStateNotifier() : super(List.filled(15, false));

  void selectIcon(int index) {
    state = state.map((state) => false).toList();
    state[index] = true;
  }
}
