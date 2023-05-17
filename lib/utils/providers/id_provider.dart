import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final idProvider = ChangeNotifierProvider((ref) {
  return IdNotifier();
});

class IdNotifier extends ChangeNotifier {
  int id = 0;

  void newId() {
    id++;
    notifyListeners();
  }
}
