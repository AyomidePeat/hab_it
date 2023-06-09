import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/model/habit_model.dart';
import 'package:hab_it/utils/providers/icon_provider.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/providers/color_provider.dart';
import '../utils/providers/frequency_provider.dart';
import '../utils/providers/habit_provider.dart';
import '../utils/textstyle.dart';
import '../widgets/color_container.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/icon_container.dart';
import '../widgets/text_field_widget.dart';
import 'frequency_screen.dart';

class NewHabitScreen extends ConsumerStatefulWidget {
  final VoidCallback load;
  const NewHabitScreen({super.key, required this.load});

  @override
  ConsumerState<NewHabitScreen> createState() => _NewHabitScreenConsumerState();
}

class _NewHabitScreenConsumerState extends ConsumerState<NewHabitScreen> {
  bool isNotified = false;
  bool isSwitched = false;
  final habitNameController = TextEditingController();
  TextEditingController reminderTextController = TextEditingController();
  void sendNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Hab It',
        body: reminderTextController.text,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(allowWhileIdle: true,
      
      )
    );
  }

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
    final frequencyRef = ref.watch(frequencyProvider);
    final size = MediaQuery.of(context).size;
    final habit = Habit(
        habitName: habitNameController.text.trim(),
        reminderText: reminderTextController.text.trim(),
        color: colorRef.selectedColor,
        icon: iconRef.selectedIcon,
        frequency: frequencyRef.selectedInterval,
        lightColor: colorRef.lightColor);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'cancel'),
              Text('New Habit', style: headline3(context)),
              CustomTextButton(
                onPressed: () {
                  if (habit.habitName.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('Please enter a title')),
                    ));
                  } else if (habit.icon == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('Please select an icon')),
                    ));
                  } else if (habit.color == Colors.white) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('Please select a colour')),
                    ));
                  } else if (isSwitched == true &&
                      habit.reminderText!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Center(child: Text('Please enter a reminder text')),
                    ));
                  } else if (habit.frequency == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('Please set a frequency')),
                    ));
                  } else {
                    if (isSwitched == false && habit.reminderText!.isEmpty) {
                      habit.reminderText = 'No reminder';
                    }

                    ref
                        .read(habitStateNotifierProvider.notifier)
                        .addHabit(habit);
                    widget.load();
                    sendNotification();
                    Navigator.pop(context);
                  }

                  // :
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
              TextFieldWidget(
                hint: 'Title',
                controller: habitNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              const ColorRow(),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
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
              const SizedBox(height: 20),
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

@immutable
class ColorRow extends ConsumerStatefulWidget {
  const ColorRow({
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
          itemCount: colors.length,
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
