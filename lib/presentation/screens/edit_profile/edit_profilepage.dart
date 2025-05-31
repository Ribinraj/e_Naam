import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/data/update_profilemodel.dart';
import 'package:e_naam/presentation/blocs/update_profile/update_profile_bloc.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/custom_dropdownbutton.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/edit_textfield.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:e_naam/widgets/loading_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenEditProfilepage extends StatefulWidget {
  final UpdateProfilemodel profile;
  const ScreenEditProfilepage({super.key, required this.profile});

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
  void initState() {
    // TODO: implement initState
    super.initState();
    fullnameController.text = widget.profile.userFullName ?? '';
    // selectedUserType = widget.profile.userOccupation ?? '';
    upiAdressController.text = widget.profile.userUPIAddress ?? '';
    pancardnumberController.text = widget.profile.panCardID ?? '';
    adharcardnumberController.text = widget.profile.adharCardID ?? '';
    adressController.text = widget.profile.address ?? '';
    gstController.text = widget.profile.gst ?? '';
  }

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
            ResponsiveSizedBox.height50,
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
            BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileSuccessState) {
                  navigateToMainPage(context, 4);
                } else if (state is UpdateProfileErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                }
              },
              builder: (context, state) {
                if (state is UpdateProfileLoadingState) {
                  return const CustomSqureLoadingButton(
                      loading: SpinKitCircle(
                        size: 15,
                        color: Appcolors.kgreenColor,
                      ),
                      color: Appcolors.kwhiteColor);
                }
                return CustomSqureButton(
                    ontap: () {
                      context.read<UpdateProfileBloc>().add(
                          UpdateProfileButtonclickEvent(
                              profile: UpdateProfilemodel(
                                  userFullName: fullnameController.text,
                                  userOccupation: selectedUserType,
                                  userUPIAddress: upiAdressController.text,
                                  panCardID: pancardnumberController.text,
                                  adharCardID: adharcardnumberController.text,
                                  address: adressController.text,
                                  gst: gstController.text,
                                  pushToken: '423743240324')));
                    },
                    text: 'Update',
                    color: Appcolors.kgreenColor);
              },
            ),
            ResponsiveSizedBox.height20
          ],
        ),
      ),
    );
  }
}
