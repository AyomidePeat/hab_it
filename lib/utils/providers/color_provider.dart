import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../colors.dart';

final colorProvider = ChangeNotifierProvider<ColorNotifier>((ref) {
  return ColorNotifier();
});

class ColorNotifier extends ChangeNotifier {
  bool redColor = false;
  bool orangeColor = false;
  bool amberColor = false;
  bool greenColor = false;
  bool purpleColor = false;
  bool indigoColor = false;
  bool blueColor = false;
  bool grey = false;
  late List<bool> colorStates = [
    redColor,
    orangeColor,
    amberColor,
    greenColor,
    purpleColor,
    indigoColor,
    blueColor,
    grey
  ];
  var selectedIndex = 0;

  void selectContainer(int index) {
    colorStates = colorStates.map((state) => false).toList();
    colorStates[index] = true;
    notifyListeners();
    if (colorStates[index] == true) {
      selectedIndex = index;
    }
    selectedColor = colors[selectedIndex];
    lightColor = lightColors[selectedIndex];
    notifyListeners();
  }

  late var selectedColor = Colors.white;
  late var lightColor = Colors.white;
}
