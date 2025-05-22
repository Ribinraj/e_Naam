import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/screen_orderdetailspage/widgets/orderstatus_tracker.dart';

import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:flutter/material.dart';

class ScreenOerdeDetailPage extends StatefulWidget {
  const ScreenOerdeDetailPage({super.key});

  @override
  State<ScreenOerdeDetailPage> createState() => _ScreenOerdeDetailPageState();
}

class _ScreenOerdeDetailPageState extends State<ScreenOerdeDetailPage> {
  String _orderStatus = "confirmed";
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
                child: ImageWithFallback(
                  imageUrl:
                      'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                )))
      ]),
      SizedBox(
        height: ResponsiveUtils.hp(10),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vivo 14 pro',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Appcolors.kblackColor,
                  fontSize: ResponsiveUtils.wp(4)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            ResponsiveSizedBox.height10,
            TextStyles.body(
                text: '4500 pts',
                weight: FontWeight.bold,
                color: Appcolors.kprimarycolor),
            ResponsiveSizedBox.height20,
            OrderStatusTracker(currentStatus: _orderStatus),
            ResponsiveSizedBox.height20,
            TextStyles.caption(
              text: 'Shipping details',
            ),
            // ResponsiveSizedBox.height5,
            Divider(
              thickness: .5,
              color: Appcolors.kgreyColor,
            ),
            TextStyles.body(text: 'Ribinraj op'),
            TextStyles.medium(
              text:
                  'Oottupurath house,\n Amarambalam South PO ,\n Malappuram dt, Kerala',
              color: Appcolors.kblackColor,
            ),

            ResponsiveSizedBox.height50,
            CustomSqureButton(
                ontap: () {
                  Navigator.pop(context);
                },
                color: Appcolors.kgreenColor,
                text: 'Back')
          ],
        ),
      ),
    ])));
  }
}
