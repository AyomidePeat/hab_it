import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'colorProvider.dart';
import 'frequencyprovider.dart';
import 'iconprovider.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, List>((ref) {
  return HabitNotifier(ref);
});

class HabitNotifier extends StateNotifier<List<bool>> {
  HabitNotifier(this.ref): super([]);
  final Ref ref;
  late final iconProviderRef = ref.watch(iconProvider);
  late final colorProviderRef = ref.watch(colorProvider);
  late final frequencyProviderRef = ref.watch(frequencyProvider);
  late var selectedIcon ;
  late var selectedColor;
  late var selectedFrequency = frequencyProviderRef.days;
@override
  void notifyListeners() {
    selectedIcon = iconProviderRef.selectedIcon;
    selectedColor = colorProviderRef.selectedColor;
     selectedFrequency = frequencyProviderRef.days;
    //super.notifyListeners();
  }
}
