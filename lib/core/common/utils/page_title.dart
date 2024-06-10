import 'package:flutter/material.dart';
import 'package:timesheet_app/core/common/utils/custom_text_style.dart';

Widget pageTitle(BuildContext context, String title) {
  return Text(
    title,
    style: CustomTextStyle.appBarTextStyle(context),
  );
}