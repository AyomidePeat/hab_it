import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/utils/textstyle.dart';
import '../model/habit_model.dart';
import '../utils/providers/habit_provider.dart';
import '../widgets/habit_container.dart';
import '../widgets/theme_button.dart';
import 'new_habit_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
   
    List <Habit>  habits = ref.watch(habitStateNotifierProvider);


    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
               Text(' HAB IT', style: headline2(context),),
              Center(
                    child: TextButton(
                    child: const Text('Add A new Habit'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewHabitScreen()));
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
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: habits.isEmpty
                ? Center(
                    child: TextButton(
                    child: const Text('Add A new Habit'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewHabitScreen()));
                    },
                  ))
                : 
            ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {

                  return  ListTile( title:
                  HabitContainer(
                          habitName:habits[index].habitName,
                          icon: habits[index].icon,
                          reminderText:habits[index]. reminderText,
                          color: habits[index].color,
                          ));
                          
                }
                     

                )
            ));
  }
}
