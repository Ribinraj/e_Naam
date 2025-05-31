import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomSqureButton extends StatelessWidget {
  const CustomSqureButton({
    super.key,
     this.ontap,
    required this.text,
    required this.color,
  });
  final void Function()? ontap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: ResponsiveUtils.hp(5.5),
        width: ResponsiveUtils.screenWidth,
        padding: EdgeInsets.symmetric(vertical: ResponsiveUtils.wp(1.5)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: .5, color: Appcolors.kprimarycolor),
        ),
        child: Center(
          child: TextStyles.body(text: text, color: Appcolors.kwhiteColor),
        ),
      ),
    );
  }
}
