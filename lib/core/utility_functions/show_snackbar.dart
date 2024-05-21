import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message, required Color bgColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
      duration: const Duration(seconds: 2),
    ),
  );
}