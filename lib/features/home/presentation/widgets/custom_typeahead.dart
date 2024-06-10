import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';

class CustomTypeAhead extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  //final String labelText;
  final List list;
  final Function onSelectFunction;

  const CustomTypeAhead({
    super.key,
    required this.controller,
    required this.hintText,
    required this.list,
    required this.onSelectFunction,
    //required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TypeAheadField(
        controller: controller,
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: ThemeColors.surface(context),
              hintText: hintText,
              //labelText: widget.labelText,
              //labelStyle: const TextStyle(fontSize: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.grey[300]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.grey[300]!,
                ),
              ),
            ),
          );
        },
        suggestionsCallback: (pattern) {
          return list
              .where((element) =>
                  element.toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSelected: (suggestion) {
          controller.text = suggestion;
          //log('Selected Option: $suggestion');
          onSelectFunction();
        },
      ),
    );
  }
}
