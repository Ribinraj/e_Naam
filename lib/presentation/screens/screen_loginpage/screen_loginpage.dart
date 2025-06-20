import 'dart:developer';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/blocs/send_otp/send_otp_bloc.dart';

import 'package:e_naam/presentation/screens/otp_verificationpage/otp_verificationpage.dart';
import 'package:e_naam/presentation/screens/screen_registerpage/screen_registerpage.dart';

import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:e_naam/widgets/custom_textfield.dart';
import 'package:e_naam/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenLoginpage extends StatefulWidget {
  const ScreenLoginpage({super.key});

  @override
  State<ScreenLoginpage> createState() => _ScreenLoginpageState();
}

class _ScreenLoginpageState extends State<ScreenLoginpage> {
  final TextEditingController numberController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: SingleChildScrollView(
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
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo white.png',
                            height: ResponsiveUtils.hp(10),
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text(
                                  'YOUR LOGO',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF667eea),
                                    letterSpacing: 2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
                    TextStyles.subheadline(
                        text: 'Get Started with your account'),
                    ResponsiveSizedBox.height10,
                    TextStyles.medium(
                      text: 'Enter your mobile number',
                    ),
                    ResponsiveSizedBox.height20,
                    CustomTextfield(
                        textInputType: TextInputType.number,
                        controller: numberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mobile number';
                          }
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            return 'Enter valid 10-digit mobile number';
                          }
                          return null;
                        },
                        labelText: 'Mobile Number'),
                    ResponsiveSizedBox.height30,
                    BlocConsumer<SendOtpBloc, SendOtpState>(
                      listener: (context, state) {
                        if (state is SendOtpSuccessState) {
                          log('usertype${state.customerType}');
                          if (state.customerType == 'NEW') {
                            CustomNavigation.pushReplaceWithTransition(
                                context,
                                ScreenRegisterPage(
                                    customerId: state.userId,
                                    mobileNumber: numberController.text));
                          } else {
                            CustomNavigation.pushReplaceWithTransition(
                                context,
                                OtpVerificationPage(
                                    customerId: state.userId,
                                    mobileNumber: numberController.text));
                          }
                        } else if (state is SendOtpErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                          ));
                        }
                      },
                      builder: (context, state) {
                        if (state is SendOtpLoadingState) {
                          return CustomSqureLoadingButton(
                              loading: SpinKitCircle(
                                size: 15,
                                color: Appcolors.kgreenColor,
                              ),
                              color: Appcolors.kwhiteColor);
                        }
                        return CustomSqureButton(
                          ontap: () {
                            FocusScope.of(context).unfocus();
                            if (key.currentState!.validate()) {
                              context.read<SendOtpBloc>().add(
                                  SendOtpButtonClickEvent(
                                      mobileNumber: numberController.text));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Please fill all fields')),
                              );
                            }
                          },
                          text: 'Continue',
                          color: Appcolors.kgreenColor,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
