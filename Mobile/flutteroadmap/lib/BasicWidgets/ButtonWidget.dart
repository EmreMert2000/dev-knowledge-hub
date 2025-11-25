//Button Widget Kurulumu
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(shadowColor: color),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}
