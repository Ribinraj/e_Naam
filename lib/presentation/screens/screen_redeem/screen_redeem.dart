import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';

import 'package:flutter/material.dart';

class ScreenRedeemPage extends StatefulWidget {
  const ScreenRedeemPage({super.key});

  @override
  State<ScreenRedeemPage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ScreenRedeemPage> {
  final TextEditingController pointController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                child: Text(
                  textAlign: TextAlign.center,
                  'Product List',
                  style: TextStyle(
                      color: Appcolors.kwhiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                color: Appcolors.kprimarycolor,
                height: ResponsiveUtils.hp(25),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              ),
              Positioned(
                  top: ResponsiveUtils.hp(15),
                  left: ResponsiveUtils.screenWidth / 13,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Appcolors.ksecondrycolor,
                    ),
                    height: ResponsiveUtils.hp(23),
                    width: ResponsiveUtils.wp(85),
                  ))
            ]),
          ],
        ),
      ),
    );
  }
}
