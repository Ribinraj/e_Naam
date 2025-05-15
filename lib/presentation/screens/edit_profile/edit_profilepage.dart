import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/custom_dropdownbutton.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/edit_textfield.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';

import 'package:flutter/material.dart';

class ScreenEditProfilepage extends StatefulWidget {
  const ScreenEditProfilepage({super.key});

  @override
  State<ScreenEditProfilepage> createState() => _ScreenEditProfilepageState();
}

class _ScreenEditProfilepageState extends State<ScreenEditProfilepage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController mobilenumberController = TextEditingController();
  final TextEditingController upiAdressController = TextEditingController();
  final TextEditingController pancardnumberController = TextEditingController();
  final TextEditingController adharcardnumberController =
      TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  String? selectedUserType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kwhiteColor,
        surfaceTintColor: Appcolors.kwhiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.subheadline(text: 'Edit Profile'),
            ResponsiveSizedBox.height20,
            TextStyles.caption(
              text: 'Your fullname',
            ),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: fullnameController,
              hinttext: 'Full Name',
            ),
            ResponsiveSizedBox.height20,
            TextStyles.caption(text: 'Mobilenumber'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: mobilenumberController,
              hinttext: 'Mobilenmber',
            ),
            ResponsiveSizedBox.height50,
            TextStyles.caption(text: 'User Occupation'),
            ResponsiveSizedBox.height10,
            CustomDropdownField(
              items: const ['Distributer', 'Dealer', 'Plumber'],
              value: selectedUserType,
              hintText: 'Select user type',
              onChanged: (value) {
                setState(() {
                  selectedUserType = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a user type' : null,
            ),
            ResponsiveSizedBox.height20,
            TextStyles.caption(text: 'UPI adress'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: upiAdressController,
              hinttext: 'UPI adress',
            ),
            ResponsiveSizedBox.height20,
            TextStyles.caption(text: 'PAN card number'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: pancardnumberController,
              hinttext: 'PAN card number',
            ),
            ResponsiveSizedBox.height50,
            TextStyles.caption(text: 'Adhar card number'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: adharcardnumberController,
              hinttext: 'Adhar card number',
            ),
            ResponsiveSizedBox.height20,
            TextStyles.caption(text: 'Your Adress'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: adressController,
              hinttext: 'Adress',
            ),
            ResponsiveSizedBox.height20,
            TextStyles.caption(text: 'GST number'),
            ResponsiveSizedBox.height10,
            CustomEditingTextfield(
              controller: gstController,
              hinttext: 'GST number',
            ),
            ResponsiveSizedBox.height50,
            CustomSqureButton(
                ontap: () {}, text: 'Update', color: Appcolors.kgreenColor)
          ],
        ),
      ),
    );
  }
}
