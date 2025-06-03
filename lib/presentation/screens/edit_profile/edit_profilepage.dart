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
  final _formKey = GlobalKey<FormState>();

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
    super.initState();
    fullnameController.text = widget.profile.userFullName ?? '';
    selectedUserType =
        _normalizeOccupation(widget.profile.userOccupation) ?? 'Distributer';
    upiAdressController.text = widget.profile.userUPIAddress ?? '';
    pancardnumberController.text = widget.profile.panCardID ?? '';
    adharcardnumberController.text = widget.profile.adharCardID ?? '';
    adressController.text = widget.profile.address ?? '';
    gstController.text = widget.profile.gst ?? '';
  }

  String? _normalizeOccupation(String? role) {
    switch (role?.toLowerCase()) {
      case 'distributer':
      case 'distributor':
        return 'Distributer';
      case 'dealer':
        return 'Dealer';
      case 'plumber':
        return 'Plumber';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Appcolors.kwhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Appcolors.kprimarycolor,
          surfaceTintColor: Appcolors.kwhiteColor,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyles.subheadline(text: 'Edit Profile'),
                ResponsiveSizedBox.height20,
                TextStyles.caption(text: 'Your fullname'),
                ResponsiveSizedBox.height10,
                CustomEditingTextfield(
                  controller: fullnameController,
                  hinttext: 'Full Name',
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Full name is required'
                      : null,
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
                TextStyles.caption(text: 'UPI address'),
                ResponsiveSizedBox.height10,
                CustomEditingTextfield(
                  controller: upiAdressController,
                  hinttext: 'UPI address',
                ),
                ResponsiveSizedBox.height20,
                TextStyles.caption(text: 'PAN card number'),
                ResponsiveSizedBox.height10,
                CustomEditingTextfield(
                  controller: pancardnumberController,
                  hinttext: 'PAN card number',
                  // No validator here
                ),
                ResponsiveSizedBox.height50,
                TextStyles.caption(text: 'Aadhaar card number'),
                ResponsiveSizedBox.height10,
                CustomEditingTextfield(
                  controller: adharcardnumberController,
                  hinttext: 'Aadhaar card number',
                  // No validator here
                ),
                ResponsiveSizedBox.height20,
                TextStyles.caption(text: 'Your Address'),
                ResponsiveSizedBox.height10,
                CustomEditingTextfield(
                  controller: adressController,
                  hinttext: 'Address',
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateProfileLoadingState) {
                      return const CustomSqureLoadingButton(
                        loading: SpinKitCircle(
                            size: 15, color: Appcolors.kgreenColor),
                        color: Appcolors.kwhiteColor,
                      );
                    }

                    return CustomSqureButton(
                      ontap: () {
                        final isFormValid = _formKey.currentState!.validate();
                        final isPanFilled =
                            pancardnumberController.text.trim().isNotEmpty;
                        final isAadharFilled =
                            adharcardnumberController.text.trim().isNotEmpty;

                        if (!isPanFilled && !isAadharFilled) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Either PAN or Aadhaar number must be provided'),
                            ),
                          );
                          return;
                        }

                        if (isFormValid) {
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
                                    pushToken: '423743240324',
                                  ),
                                ),
                              );
                        }
                      },
                      text: 'Update',
                      color: Appcolors.kgreenColor,
                    );
                  },
                ),
                ResponsiveSizedBox.height20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
