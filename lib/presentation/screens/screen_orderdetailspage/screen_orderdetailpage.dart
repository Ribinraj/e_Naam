import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';

import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:flutter/material.dart';

class ScreenOerdeDetailPage extends StatefulWidget {
  const ScreenOerdeDetailPage({super.key});

  @override
  State<ScreenOerdeDetailPage> createState() => _ScreenOerdeDetailPageState();
}

class _ScreenOerdeDetailPageState extends State<ScreenOerdeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          color: Appcolors.kprimarycolor,
          height: ResponsiveUtils.hp(25),
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
                    'ORDER DETAILS',
                    style: TextStyle(
                        color: Appcolors.kwhiteColor,
                        fontSize: 18,
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
            left: ResponsiveUtils.screenWidth / 7,
            child: Container(
                width: ResponsiveUtils.wp(70),
                height: ResponsiveUtils.hp(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Appcolors.kwhiteColor,
                    border:
                        Border.all(width: 1, color: Appcolors.kprimarycolor)),
                child: const Hero(
                  tag: '1',
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
        height: ResponsiveUtils.hp(10),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.medium(
                text: 'Mobile Phone',
                weight: FontWeight.bold,
                color: Appcolors.kgreyColor),
            ResponsiveSizedBox.height5,
            TextStyles.subheadline(text: '2399 pts', weight: FontWeight.bold),
            ResponsiveSizedBox.height10,
            TextStyles.medium(
                text: 'Shipping Adress', color: Appcolors.kgreyColor),
            TextStyles.body(
                text: 'OOttupurath house,\nAmarambalam south po\nMalappuram Dt')
          ],
        ),
      ),
    ])));
  }
}
