import 'package:flutter/material.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget buttonWidget;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ThemeColors.primary(context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: buttonWidget,
        ),
      ),
    );
  }
}
