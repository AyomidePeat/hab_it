import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  const TextFieldWidget({
    super.key, required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:40, 
      child: TextField(
        cursorHeight: 20,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          filled: true,
          hintText: hint,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
