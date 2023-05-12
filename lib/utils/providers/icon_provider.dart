import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../icons.dart';

final iconProvider = ChangeNotifierProvider<IconNotifier>((ref) {
  return IconNotifier();
});

class IconNotifier extends ChangeNotifier {
  bool icon1 = false;
  bool icon2 = false;
  bool icon3 = false;
  bool icon4 = false;
  bool icon5 = false;
  bool icon6 = false;
  bool icon7 = false;
  bool icon8 = false;
  bool icon9 = false;
  bool icon10 = false;
  bool icon11 = false;
  bool icon12 = false;
  bool icon13 = false;
  bool icon14 = false;
  bool icon15 = false;
  late List<bool> iconStates = [
    icon1,
    icon2,
    icon3,
    icon4,
    icon5,
    icon6,
    icon7,
    icon8,
    icon9,
    icon10,
    icon11,
    icon12,
    icon13,
    icon14,
    icon15,
  ];
  var selectedIndex = 0;

  selectIcon(int index) {
    iconStates = iconStates.map((state) => false).toList();
    iconStates[index] = true;
    notifyListeners();
    if (iconStates[index] == true) {
      selectedIndex = index;
  
    }
 
      selectedIcon = icons[selectedIndex];
    
    notifyListeners();
  }

  late var selectedIcon = '';

}
