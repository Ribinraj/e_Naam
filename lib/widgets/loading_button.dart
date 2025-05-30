import 'package:e_naam/core/colors.dart';

import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomSqureLoadingButton extends StatelessWidget {
  const CustomSqureLoadingButton({
    super.key,

    required this.loading,
    required this.color,
  });

  final Widget loading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveUtils.hp(5.5),
      width: ResponsiveUtils.screenWidth,
      padding: EdgeInsets.symmetric(vertical: ResponsiveUtils.wp(1.5)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: .5, color: Appcolors.kprimarycolor),
      ),
      child: Center(
        child:loading,
      ),
    );
  }
}
