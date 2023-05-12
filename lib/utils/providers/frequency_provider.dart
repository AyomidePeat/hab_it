import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final frequencyProvider = ChangeNotifierProvider<FrequencyNotifier>((ref) {
  return FrequencyNotifier();
});

class FrequencyNotifier extends ChangeNotifier {
  bool none = false;
  bool daily = false;
  bool weekly = false;
  bool monthly = false;
  void noneInterval() {
    none = true;
    daily = false;
    weekly = false;
    monthly = false;
    notifyListeners();
  }

  void dailyInterval() {
    none = false;
    daily = true;
    weekly = false;
    monthly = false;
    notifyListeners();
  }

  void weeklyInterval() {
    none = false;
    daily = false;
    weekly = true;
    monthly = false;
    if (days > 7) {
      days = 3;
    }
    notifyListeners();
  }

  void monthlyInterval() {
    none = false;
    daily = false;
    weekly = false;
    monthly = true;
    notifyListeners();
  }

  int days = 3;
  void increment() {
    if (weekly && days <= 6) {
      days++;
      notifyListeners();
    }
    if (monthly && days <= 30) {
      days++;
      notifyListeners();
    }
  }

  void decrement() {
    if (days > 1) {
      days--;
      notifyListeners();
    }
  }
}
