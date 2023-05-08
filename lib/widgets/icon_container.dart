import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../utils/theme.dart';

class IconContainer extends ConsumerWidget {
  final bool isPressed;
  final String icon;
  final selectIcon;
  const IconContainer({
    super.key,
    required this.isPressed,
    required this.icon,
    required this.selectIcon,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeNotifierProvider);
    return InkWell(
      onTap: () {
        selectIcon();
      },
      child: Container(
          height: 40,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                isPressed ? Border.all(width: 2,  color:theme.isDarkModeOn ? Colors.white: Colors.black) : null,
            color:
                theme.isDarkModeOn ? blueGrey : Color.fromARGB(26, 162, 25, 25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: theme.isDarkModeOn ? Colors.white : Colors.black,
                fit: BoxFit.contain,
                height: 15,
              ),
            ],
          )),
    );
  }
}
