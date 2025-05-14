import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.readonly,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? readonly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Appcolors.ksecondrycolor,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      readOnly: readonly ?? false,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: InputDecoration(
          fillColor: Appcolors.kwhiteColor,
          filled: true,
          // border: InputBorder.none,
          isDense: true,
          errorMaxLines: 3,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          hintText: labelText,
          hintStyle: const TextStyle(
              color: Appcolors.ksecondrycolor,
              fontSize: 11,
              fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.ksecondrycolor, width: .5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.ksecondrycolor, width: .5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.kredColor, width: .5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide: BorderSide(color: Appcolors.kredColor, width: .5))),
    );
  }
}
