import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hab_it/screens/homescreen.dart';
import 'package:hab_it/utils/state.dart';
import 'package:hab_it/widgets/theme_button.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/textstyle.dart';
import '../widgets/color_container.dart';
import '../widgets/custom_elevlated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/icon_container.dart';
import '../widgets/text_field_widget.dart';
import 'frequency_screen.dart';

final iconProvider = Provider<IconRow>((ref) {
  return IconRow();
});
final habitProvider = StateProvider<NewHabitScreen>((ref) {
  return NewHabitScreen();
});

class NewHabitScreen extends ConsumerStatefulWidget {
  const NewHabitScreen({super.key});

  @override
  ConsumerState<NewHabitScreen> createState() => _NewHabitScreenConsumerState();
}

class _NewHabitScreenConsumerState extends ConsumerState<NewHabitScreen> {
  bool isNotified = false;
  bool isSwitched = false;

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
    final habitProviderRef = ref.watch(habitProvider);
    final size = MediaQuery.of(context).size;
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
                onPressed: () {},
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
              const TextFieldWidget(hint: 'Title'),
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
                    child: const TextFieldWidget(hint: 'Time'),
                  ),
                  SizedBox(
                      width: size.width * 0.57,
                      child: const TextFieldWidget(hint: 'Reminder text')),
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
              SizedBox(height:20),
              IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()) ), icon: Icon(Icons.forward))
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
    final iconRef = ref.watch(iconStateProvider);
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

class ColorRow extends StatefulWidget {
  ColorRow({
    super.key,
  });

  @override
  State<ColorRow> createState() => _ColorRowState();
}

class _ColorRowState extends State<ColorRow> {
  List colors = [red, amber, green, purple, indigo, blueGrey, grey];
  List<bool> containerStates = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void selectContainer(int index) {
    setState(() {
      containerStates = containerStates.map((state) => false).toList();
      containerStates[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                selectContainer(index);
              },
              color: colors[index],
              index: index,
              isPressed: containerStates[index],
            );
          }),
    );
  }
}
