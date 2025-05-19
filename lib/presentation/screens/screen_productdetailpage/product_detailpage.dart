import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';

import 'package:e_naam/core/responsive_utils.dart';

import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';

import 'package:flutter/material.dart';

class ProductDetailpage extends StatefulWidget {
  const ProductDetailpage({super.key});

  @override
  State<ProductDetailpage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ProductDetailpage> {
  final TextEditingController pointController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          color: Appcolors.kprimarycolor,
          height: ResponsiveUtils.hp(30),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Appcolors.kwhiteColor,
                        size: 25,
                      )),
                  ResponsiveSizedBox.width50,
                  const Text(
                    textAlign: TextAlign.center,
                    'Product Details',
                    style: TextStyle(
                        color: Appcolors.kwhiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
        Positioned(
            top: ResponsiveUtils.hp(15),
            left: ResponsiveUtils.screenWidth / 12,
            child: Container(
                width: ResponsiveUtils.wp(80),
                height: ResponsiveUtils.hp(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Appcolors.kwhiteColor,
                    border:
                        Border.all(width: 1, color: Appcolors.kprimarycolor)),
                child: const Hero(
                  tag:'1' ,
                  child: ImageWithFallback(
                    imageUrl:
                        'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                )))
      ]),
      SizedBox(
        height: ResponsiveUtils.hp(15),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.body(
                text: 'Mobile Phone',
                weight: FontWeight.bold,
                color: Appcolors.kgreyColor),
            ResponsiveSizedBox.height5,
            TextStyles.headline(text: '₹ 2399', weight: FontWeight.bold),
            ResponsiveSizedBox.height5,
            TextStyles.body(
                text: 'Description',
                weight: FontWeight.bold,
                color: Appcolors.kgreyColor),
            ResponsiveSizedBox.height5,
            Text(
              'Product details encompass all the specific information about a product, including its name, size, color, materials, features, and price. This information helps customers understand the product and make informed purchasing decisions. Product details can be found on packaging, product inserts Product details encompass all the specific information about a product, including its name, size, color, materials, features, and price. This information helps customers understand the product and make informed purchasing decisions. Product details can be found on packaging, product inserts',
              style: TextStyle(
                color: Appcolors.kblackColor,
                fontSize: ResponsiveUtils.wp(3),
              ),
            ),
            ResponsiveSizedBox.height30,
            CustomSqureButton(
                ontap: () {}, text: 'Buy Now', color: Appcolors.kgreenColor)
          ],
        ),
      ),
    ])));
  }
}
