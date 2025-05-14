import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:e_naam/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ScreenLoginpage extends StatefulWidget {
  const ScreenLoginpage({super.key});

  @override
  State<ScreenLoginpage> createState() => _ScreenLoginpageState();
}

class _ScreenLoginpageState extends State<ScreenLoginpage> {
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Appcolors.kprimarycolor,
              height: ResponsiveUtils.hp(60),
              width: ResponsiveUtils.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: ResponsiveUtils.hp(40),
                    width: ResponsiveUtils.wp(80),
                    'assets/images/6c383540-91e2-467d-becf-10efcb5a8bda-removebg-preview.png',
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: TextStyles.headline(
                      text: 'Use e_Naam Points to earn  cashbacks and rewards',
                      color: Appcolors.ksecondrycolor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.subheadline(text: 'Get Started with e_Naam ...'),
                  ResponsiveSizedBox.height10,
                  TextStyles.medium(
                    text: 'Enter your mobile number',
                  ),
                  ResponsiveSizedBox.height20,
                  CustomTextfield(
                      controller: numberController,
                      labelText: 'Enter mobilenumber'),
                  ResponsiveSizedBox.height30,
                  CustomSqureButton(
                    ontap: () {
                      CustomNavigation.pushWithTransition(
                          context, ScreenMainPage());
                    },
                    text: 'Continue',
                    color: Appcolors.kgreenColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
