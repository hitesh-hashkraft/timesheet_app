import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String hintText;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ThemeColors.surface(context),
        border: Border.all(
          color: Colors.grey[300]!,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        underline: Container(),
        hint: Text(hintText),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        style: GoogleFonts.dmSans(
          textStyle: TextStyle(
            color: ThemeColors.onSurface(context),
            fontSize: 16,
            //fontWeight: FontWeight.w400,
          ),
        ),
        dropdownColor: ThemeColors.surface(context),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
