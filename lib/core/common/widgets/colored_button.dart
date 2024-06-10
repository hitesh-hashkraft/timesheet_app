import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color color;

  const ColoredButton(
      {super.key, required this.iconData, required this.onPressed, required this.color,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
