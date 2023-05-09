import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/utils/colors.dart';
import 'package:hab_it/widgets/custom_elevlated_button.dart';
import '../utils/textstyle.dart';
import '../utils/theme.dart';
import '../widgets/custom_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FrequencyScreen extends ConsumerStatefulWidget {
  const FrequencyScreen({super.key});

  @override
  ConsumerState<FrequencyScreen> createState() => _FrequencyScreenState();
}

class _FrequencyScreenState extends ConsumerState<FrequencyScreen> {
  bool none = false;
  bool daily = false;
  bool weekly = false;
  bool monthly = false;
  void noneInterval() {
    setState(() {
      none = true;
      daily = false;
      weekly = false;
      monthly = false;
    });
  }

  void dailyInterval() {
    setState(() {
      none = false;
      daily = true;
      weekly = false;
      monthly = false;
    });
  }

  void weeklyInterval() {
    setState(() {
      none = false;
      daily = false;
      weekly = true;
      monthly = false;
      if (days > 7) {
        days = 3;
      }
    });
  }

  void monthlyInterval() {
    setState(() {
      none = false;
      daily = false;
      weekly = false;
      monthly = true;
    });
  }

  int days = 3;
  void increment() {
    if (weekly && days <= 6) {
      setState(() {
        days = 3;
        days++;
      });
    }
    if (monthly && days <= 30) {
      setState(() {
        days++;
      });
    }
  }

  void decrement() {
    if (days > 1) {
      setState(() {
        days--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     final iconColor = ref.watch(themeNotifierProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                icon:  Icon(Icons.arrow_back_ios, color: iconColor.isDarkModeOn? Colors.white:Colors.black,),
                onPressed: () => Navigator.pop(context),
              ),
              Text('Frequency', style: headline3(context)),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomContainer(
            height: size.height * 0.27,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InervalContainer(
                    text: 'None', onPressed: noneInterval, isPressed: none),
                const Divider(
                  thickness: 2,
                ),
                InervalContainer(
                    text: 'Daily', onPressed: dailyInterval, isPressed: daily),
                const Divider(
                  thickness: 2,
                ),
                InervalContainer(
                    text: 'Weekly',
                    onPressed: weeklyInterval,
                    isPressed: weekly),
                const Divider(
                  thickness: 2,
                ),
                InervalContainer(
                    text: 'Monthly',
                    onPressed: monthlyInterval,
                    isPressed: monthly),
              ],
            ),
          ),
          const SizedBox(height: 15),
          if (monthly || weekly) Text('How many days?'.toUpperCase()),
          const SizedBox(height: 15),
          if (monthly)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                    width: 200,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Row(
                        children: [
                          Text('$days', style: const TextStyle(fontSize: 18)),
                          const Text(' / month'),
                        ],
                      ),
                    )),
                CustomElevatedButton(
                    onPressed: decrement,
                    height: 40,
                    width: 60,
                    child: const Icon(Icons.remove, size: 15)),
                CustomElevatedButton(
                    onPressed: increment,
                    height: 40,
                    width: 60,
                    child: const Icon(Icons.add, size: 15))
              ],
            ),
          if (weekly)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                    width: 200,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Row(
                        children: [
                          Text('$days', style: const TextStyle(fontSize: 18)),
                          const Text(' / week'),
                        ],
                      ),
                    )),
                CustomElevatedButton(
                    onPressed: decrement,
                    height: 40,
                    width: 60,
                    child: const Icon(Icons.remove, size: 15)),
                CustomElevatedButton(
                    onPressed: increment,
                    height: 40,
                    width: 60,
                    child: const Icon(Icons.add, size: 15))
              ],
            ),
        ]),
      ),
    );
  }
}

class InervalContainer extends ConsumerWidget {
  final onPressed;
  final String text;
  final bool isPressed;
  const InervalContainer({
    super.key,
    this.onPressed,
    required this.text,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context, ref) {
        final iconColor = ref.watch(themeNotifierProvider);

    return InkWell(
      splashColor: blueGrey,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              
            ),
            if (isPressed) SvgPicture.asset('images/check.svg',color: iconColor.isDarkModeOn? Colors.white: Colors.black),
          ],
        ),
      ),
    );
  }
}
