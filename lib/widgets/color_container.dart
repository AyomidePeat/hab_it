import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColorContainer extends StatefulWidget {
  final Color color;
  bool isPressed;
  final int index;
final selectContainer;

  ColorContainer({
    super.key,
    required this.color,
    required this.isPressed,
    required this.index,
    required this.selectContainer,
  });

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
          widget.selectContainer();
          //widget.isPressed = !widget.isPressed;
        
        print('Container is ${widget.isPressed}');
      },
      child: Container(
        height: 40,
        width: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
        child: widget.isPressed
            ? SvgPicture.asset('images/check.svg')
            : const Text(''),
      ),
    );
  }
}
