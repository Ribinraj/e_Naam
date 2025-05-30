import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';

import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/custom_dropdownbutton.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/edit_textfield.dart';
import 'package:e_naam/presentation/screens/otp_verificationpage/otp_verificationpage.dart';

import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';

import 'package:flutter/material.dart';

class ScreenRegisterPage extends StatefulWidget {
  const ScreenRegisterPage({super.key});

  @override
  State<ScreenRegisterPage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ScreenRegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobilenumberController = TextEditingController();
  String? selectedUserType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Appcolors.kprimarycolor,
              height: ResponsiveUtils.hp(40),
              width: ResponsiveUtils.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: ResponsiveUtils.hp(20),
                    width: ResponsiveUtils.wp(40),
                    'assets/images/6c383540-91e2-467d-becf-10efcb5a8bda-removebg-preview.png',
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: TextStyles.subheadline(
                      text: 'Use e_Naam Points to earn\ncashbacks and rewards',
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
                  TextStyles.subheadline(text: 'Get Register with e_Naam ...'),
                  ResponsiveSizedBox.height10,
                  TextStyles.medium(
                    text: 'Enter your full name',
                  ),
                  ResponsiveSizedBox.height10,
                  CustomEditingTextfield(
                      controller: nameController, hinttext: 'Enter full name'),
                  ResponsiveSizedBox.height20,
                  TextStyles.medium(
                    text: 'Enter your adress',
                  ),
                  ResponsiveSizedBox.height10,
                  CustomEditingTextfield(
                      controller: mobilenumberController,
                      hinttext: 'Enter mobilenumber'),
                  ResponsiveSizedBox.height20,
                  TextStyles.medium(
                    text: 'Select user type',
                  ),
                  ResponsiveSizedBox.height10,
                  CustomDropdownField(
                    items: const ['Distributer', 'Dealer', 'Plumber'],
                    value: selectedUserType,
                    hintText: 'Select user type',
                    onChanged: (value) {
                      setState(() {
                        selectedUserType = value;
                        debugPrint(selectedUserType);
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a user type' : null,
                  ),
                  ResponsiveSizedBox.height50,
                  CustomSqureButton(
                    ontap: () {
                      CustomNavigation.pushWithTransition(
                          context, OtpVerificationPage());
                    },
                    text: 'Register',
                    color: Appcolors.kgreenColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
