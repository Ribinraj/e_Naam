import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:flutter/material.dart';

class CustomEditingTextfield extends StatelessWidget {
  const CustomEditingTextfield({
    super.key,
    required this.controller,
    this.hinttext,
    this.textInputType,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.readonly, 
    this.textcapitalisation,
  });

  final TextEditingController controller;
  final String? hinttext;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? readonly;
  final TextCapitalization? textcapitalisation;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Appcolors.kgreyColor,
      textCapitalization: textcapitalisation ?? TextCapitalization.none, // Fixed: Use null-aware operator instead of !
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
          hintText: hinttext,
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
              borderSide: BorderSide(color: Appcolors.kredColor, width: .5))),
    );
  }
}