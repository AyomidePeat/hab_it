import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/utils/colors.dart';
import 'package:hab_it/utils/theme.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context,  ref) {
    final theme = ref.watch(themeNotifierProvider);

    return IconButton(
      icon: Icon(theme.isDarkModeOn ? Icons.wb_sunny : Icons.nightlight_round, color: theme.isDarkModeOn ? Colors.white: blueGrey ,),
      onPressed: () {
        theme.toggleTheme();
      },
    );
  }
}
