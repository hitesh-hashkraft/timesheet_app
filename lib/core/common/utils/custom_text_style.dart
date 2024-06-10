import 'package:flutter/material.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';

class CustomTextStyle {
  static TextStyle appBarTextStyle(BuildContext context) {
    return TextStyle(
      color: ThemeColors.onPrimary(context),
      fontWeight: FontWeight.w500,
    );
  }
}
