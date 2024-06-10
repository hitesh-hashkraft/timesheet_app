import 'package:flutter/material.dart';

class ThemeTextStyles {
  static TextStyle displayLarge(BuildContext context) {
    print(Theme.of(context).textTheme.displayLarge!);
    return Theme.of(context).textTheme.displayLarge!;
  }

  static TextStyle displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium!;
  }

  static TextStyle displaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!;
  }

  static TextStyle headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }

  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!;
  }

  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }

  static TextStyle titleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!;
  }

  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!;
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  static TextStyle labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!;
  }

  static TextStyle labelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!;
  }
}
