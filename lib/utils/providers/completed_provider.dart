import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final completedProvider = ChangeNotifierProvider((ref) {
  return CompletedNotifier();
});

class CompletedNotifier extends ChangeNotifier {
  bool isCompleted = false;

  void completed() {
    isCompleted = true;
    notifyListeners();
  }
}
