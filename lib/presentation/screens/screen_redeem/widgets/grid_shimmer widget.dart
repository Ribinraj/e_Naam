import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class GridloadingShimmerWidget extends StatelessWidget {
  const GridloadingShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.7,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Appcolors.kprimarycolor.withOpacity(.2),
          highlightColor: const Color.fromARGB(255, 255, 242, 242),
          period: const Duration(seconds: 3),
          enabled: true,
          child: Container(
            height: ResponsiveUtils.hp(25),
            width: double.infinity,
            color: Appcolors.ksecondrycolor,
          ),
        );
      },
    );
  }
}
