import 'package:flutter/material.dart';

class ThemePaddings {
  static EdgeInsets smallPadding(BuildContext context) {
    return const EdgeInsets.all(8.0);
  }

  static EdgeInsets mediumPadding(BuildContext context) {
    return const EdgeInsets.all(16.0);
  }

  static EdgeInsets largePadding(BuildContext context) {
    return const EdgeInsets.all(24.0);
  }

  static EdgeInsets horizontalSmallPadding(BuildContext context) {
    return const EdgeInsets.symmetric(horizontal: 8.0);
  }

  static EdgeInsets horizontalMediumPadding(BuildContext context) {
    return const EdgeInsets.symmetric(horizontal: 16.0);
  }

  static EdgeInsets horizontalLargePadding(BuildContext context) {
    return const EdgeInsets.symmetric(horizontal: 24.0);
  }

  static EdgeInsets verticalSmallPadding(BuildContext context) {
    return const EdgeInsets.symmetric(vertical: 8.0);
  }

  static EdgeInsets verticalMediumPadding(BuildContext context) {
    return const EdgeInsets.symmetric(vertical: 16.0);
  }

  static EdgeInsets verticalLargePadding(BuildContext context) {
    return const EdgeInsets.symmetric(vertical: 24.0);
  }
}
