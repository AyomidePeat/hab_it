// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/utils/textstyle.dart';
import '../model/habit_model.dart';
import '../utils/colors.dart';
import '../utils/providers/habit_provider.dart';
import '../utils/quotes.dart';
import '../utils/theme.dart';
import '../widgets/custom_container.dart';
import '../widgets/habit_container.dart';
import '../widgets/theme_button.dart';
import 'new_habit_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenConsumerState();
}

class _HomeScreenConsumerState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      currentIndex = (currentIndex + 1) % quotes.length;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);

    List<Habit> habits = ref.watch(habitStateNotifierProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                ' HAB IT',
                style: headline2(context),
              ),
              Center(
                  child: TextButton(
                child: const Text('Add A new Habit'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
              ))
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            ThemeButton(),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 130,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme.isDarkModeOn
                        ? Colors.blue
                        : Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quotes[currentIndex],
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            habits.isEmpty
                ? Center(
                    child: TextButton(
                    child: const Text('Add A new Habit'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                  ))
                : ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: HabitContainer(
                        habitName: habits[index].habitName,
                        icon: habits[index].icon,
                        reminderText: habits[index].reminderText,
                        color: habits[index].color,
                      ));
                    }),
          ],
        ));
  }
}
