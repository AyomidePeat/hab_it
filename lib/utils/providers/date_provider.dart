import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../days.dart';

final dateProvider = ChangeNotifierProvider<DateNotifier>((ref) {
  return DateNotifier();
});

class DateNotifier extends ChangeNotifier {
  bool sun = false;
  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thu = false;
  bool fri = false;
  bool sat = false;
 late List<bool> dateStates=[sun,mon,tue,wed,thu,fri,sat,];
  var selectedIndex = [0,1,2,3,4,5,6,];

//  void selectDay(int index) {
//     dateStates = dateStates.map((state) => false).toList();
//     dateStates[index] = true;
//     notifyListeners();
//     if (dateStates[index] == true) {
//       selectedIndex = index;
//     }
//     selectedDay = days[selectedIndex];
   
//     notifyListeners();
//   }

//   late var selectedDay = '';
 
}
