import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/widgets/custom_container.dart';
import '../model/habit_model.dart';
import '../utils/providers/colorProvider.dart';
import '../utils/providers/frequencyprovider.dart';
import '../utils/providers/habitprovider.dart';
import '../utils/providers/iconprovider.dart';
import '../utils/textstyle.dart';
import '../widgets/habit_container.dart';
import '../widgets/theme_button.dart';
import 'new_habit_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
   
    List <Habit>  habits = ref.watch(HabitStateNotifierProvider);
  //   final size = MediaQuery.of(context).size;
  //   List<Color> habitColors = habit.map((item) => item.color).toList();
  //   List habitNames = habit.map((item) => item.habitName).toList();
  //  List icon = habit.map((item) => item.icon).toList();
  //   List reminderText = habit.map((item) => item.reminderText).toList();

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(' Hab It'),
              Center(
                    child: TextButton(
                    child: Text('Add A new Habit'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewHabitScreen()));
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
                    child: Text('Add A new Habit'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewHabitScreen()));
                    },
                  ))
                : 
            ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) { print('habit name: ${habits[index].habitName}');

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
