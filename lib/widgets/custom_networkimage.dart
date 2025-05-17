import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageWithFallback extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageWithFallback({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Center(
        child: SpinKitPulse(
          color: Appcolors.ksecondrycolor,
          size: ResponsiveUtils.wp(5),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported_outlined,
              size: ResponsiveUtils.wp(10),
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Image not available',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: ResponsiveUtils.wp(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
