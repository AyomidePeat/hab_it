import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hab_it/widgets/custom_container.dart';

import '../utils/providers/habitprovider.dart';
import '../utils/textstyle.dart';
import '../widgets/theme_button.dart';


class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final habitProviderRef = ref.watch(habitProvider);
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Hab It'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            ThemeButton(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomContainer(
                  width: double.infinity, height: size.height*0.3, child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        SvgPicture.asset(habitProviderRef.selectedIcon),
                        const Text('habit'),
                        CustomContainer(width: 40, height: 40, child: SvgPicture.asset('images/check.svg', color:habitProviderRef.selectedColor),)
                   // if (iconProviderRef.hasDa)
                      ],)
                    ],
                  ))
            ],
          ),
        ));
  }
}
