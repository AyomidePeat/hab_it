// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/utils/textstyle.dart';
import 'package:hab_it/widgets/custom_elevlated_button.dart';
import '../model/habit_model.dart';
import '../utils/providers/habit_provider.dart';
import '../utils/quotes.dart';
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
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      currentIndex = (currentIndex + 1) % quotes.length;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Habit> habits = ref.watch(habitStateNotifierProvider);
    final size = MediaQuery.of(context).size;
    final currentDate = DateTime.now().day;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                ' HAB IT',
                style: headline2(context),
              ),
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
                    color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                  child: Text(
                    quotes[currentIndex],
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
            habits.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.3,
                      ),
                     
                    ],
                  )
                : Flexible(
                    child: ListView.builder(
                        itemCount: habits.length,
                        itemBuilder: (context, index) {
                          bool isCompleted = habits[index].isCompleted;
                          return ListTile(
                              title: HabitContainer(
                            currentDay: currentDate,
                            habit: habits[index],
                            onPressed: () {
                        habits[index].markAsCompleted();
                           
                             
                              
                            },
                          ));
                        }).animate().slide(),
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewHabitScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_circle_outline_rounded),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 5),
                      child: Text(
                        'New Habit',
                        style: bodyText2(context),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          
          ],
        ));
  }
}
