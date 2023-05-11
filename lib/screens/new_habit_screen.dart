import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/model/habit_model.dart';
import 'package:hab_it/screens/homescreen.dart';
import 'package:hab_it/utils/providers/iconprovider.dart';
import 'package:hab_it/widgets/habit_container.dart';
import 'package:hab_it/widgets/theme_button.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/providers/colorprovider.dart';
import '../utils/providers/habitprovider.dart';
import '../utils/textstyle.dart';
import '../widgets/color_container.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/icon_container.dart';
import '../widgets/text_field_widget.dart';
import 'frequency_screen.dart';

class NewHabitScreen extends ConsumerStatefulWidget {
  const NewHabitScreen({super.key});

  @override
  ConsumerState<NewHabitScreen> createState() => _NewHabitScreenConsumerState();
}

class _NewHabitScreenConsumerState extends ConsumerState<NewHabitScreen> {
  bool isNotified = false;
  bool isSwitched = false;
  final habitNameController = TextEditingController();
  final reminderTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    
    habitNameController.text = '';
    reminderTextController.text = '';
  }
  @override
  void dispose() {
    habitNameController.dispose();
    reminderTextController.dispose();
    
    super.dispose();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final colorRef = ref.watch(colorProvider);
    final iconRef = ref.watch(iconProvider);
    final habitRef = ref.watch(HabitStateNotifierProvider);
    final size = MediaQuery.of(context).size;
    final habit = Habit(
        habitName: habitNameController.text,
        reminderText: reminderTextController.text,
        color: colorRef.selectedColor,
        icon: iconRef.selectedIcon
        );debugPrint(habit.toString());
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ThemeButton(),
              CustomTextButton(onPressed: () {}, text: 'cancel'),
              Text('New Habit', style: headline3(context)),
              CustomTextButton(
                onPressed: () {
                  ref.read(HabitStateNotifierProvider.notifier).addHabit(habit);
                  Navigator.pop(context);
                },
                text: 'Done',
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(hint: 'Title', controller: habitNameController,  ),
              const SizedBox(
                height: 15,
              ),
              ColorRow(),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FrequencyScreen())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Frequency', style: headline3(context)),
                        Text('How often?', style: bodyText3(context)),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reminder', style: headline3(context)),
                      Text('Just notifications', style: bodyText3(context)),
                    ],
                  ),
                  CupertinoSwitch(
                    dragStartBehavior: DragStartBehavior.start,
                    thumbColor: Colors.white,
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: green,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: TextFieldWidget(
                      hint: 'Time',
                      controller: reminderTextController,
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.57,
                      child: TextFieldWidget(
                        hint: 'Reminder text',
                        controller: reminderTextController,
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Icon', style: headline3(context)),
              const SizedBox(
                height: 5,
              ),
              const IconRow(),
              SizedBox(height: 20),
              IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  icon: Icon(Icons.forward))
            ],
          ),
        ),
      ),
    );
  }
}

class IconRow extends ConsumerStatefulWidget {
  const IconRow({
    super.key,
  });

  @override
  ConsumerState<IconRow> createState() => _IconRowState();
}

class _IconRowState extends ConsumerState<IconRow> {
  @override
  Widget build(BuildContext context) {
    final iconRef = ref.watch(iconProvider);
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisExtent: 40,
                mainAxisSpacing: 7,
                crossAxisSpacing: 15),
            itemCount: icons.length,
            itemBuilder: (context, index) {
              return IconContainer(
                isPressed: iconRef.iconStates[index],
                icon: icons[index],
                selectIcon: () {
                  iconRef.selectIcon(index);
                },
              );
            }));
  }
}

class ColorRow extends ConsumerStatefulWidget {
  ColorRow({
    super.key,
  });

  @override
  ConsumerState<ColorRow> createState() => _ColorRowState();
}

class _ColorRowState extends ConsumerState<ColorRow> {
  @override
  Widget build(BuildContext context) {
    final colorRef = ref.watch(colorProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50),
      child: GridView.builder(
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: colors.length,
              crossAxisSpacing: 7,
              mainAxisExtent: 40),
          itemBuilder: (context, index) {
            return ColorContainer(
              selectContainer: () {
                colorRef.selectContainer(index);
              },
              color: colors[index],
              index: index,
              isPressed: colorRef.colorStates[index],
            );
          }),
    );
  }
}
