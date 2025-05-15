import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hintText,
    this.validator,
  });

  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12,),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Appcolors.kwhiteColor,
        filled: true,
        isDense: true,
        errorMaxLines: 3,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Appcolors.kgreyColor,
            fontSize: 11,
            fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusStyles.kradius5(),
            borderSide:
                const BorderSide(color: Appcolors.kgreyColor, width: .5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusStyles.kradius5(),
            borderSide:
                const BorderSide(color: Appcolors.kgreyColor, width: .5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusStyles.kradius5(),
            borderSide:
                const BorderSide(color: Appcolors.kredColor, width: .5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusStyles.kradius5(),
            borderSide:
                const BorderSide(color: Appcolors.kredColor, width: .5)),
      ),
    );
  }
}
