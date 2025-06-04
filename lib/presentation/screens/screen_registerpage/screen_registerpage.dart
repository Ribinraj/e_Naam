import 'dart:async';
import 'dart:developer';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/verify_otpmodel.dart';
import 'package:e_naam/presentation/blocs/resend_otp/resend_otp_bloc.dart';
import 'package:e_naam/presentation/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/custom_dropdownbutton.dart';
import 'package:e_naam/presentation/screens/edit_profile/widgets/edit_textfield.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_sharedpreferences.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:e_naam/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ScreenRegisterPage extends StatefulWidget {
  final String customerId;
  final String mobileNumber;

  const ScreenRegisterPage({
    super.key,
    required this.customerId,
    required this.mobileNumber,
  });

  @override
  State<ScreenRegisterPage> createState() => _ScreenRegisterPageState();
}

class _ScreenRegisterPageState extends State<ScreenRegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String? selectedUserType;
  bool _isOtpButtonEnabled = false;
  int _resendTimer = 30;
  Timer? _timer;
  String _currentOtp = '';
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();

    // Add listeners to validate form
    nameController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Cancel timer first
    _timer?.cancel();
    _timer = null;

    // Safe disposal of controllers
    try {
      nameController.dispose();
      _otpController.dispose();
    } catch (e) {
      // Controllers already disposed, ignore
    }

    super.dispose();
  }

  void _validateForm() {
    if (!mounted) return;
    setState(() {
      _isFormValid = nameController.text.trim().isNotEmpty &&
          selectedUserType != null &&
          _currentOtp.length == 6;
    });
  }

  void _startResendTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resetResendTimer() {
    if (!mounted) return;
    setState(() {
      _resendTimer = 30;
    });
    _startResendTimer();
  }

  void _resendOtp() {
    if (!mounted) return;

    // Clear OTP field safely
    if (_otpController.hasListeners) {
      _otpController.clear();
    }

    setState(() {
      _currentOtp = '';
      _isOtpButtonEnabled = false;
      _isFormValid = false;
    });

    // Reset and restart the timer
    _resetResendTimer();

    // Call resend OTP API
    context
        .read<ResendOtpBloc>()
        .add(ResendOtpClickEvent(userId: widget.customerId));
  }

  void _handleRegistration() async {
    final pushtoken = await getPushToken();
    if (_isFormValid) {
      // Here you can add registration logic with OTP verification
      context.read<VerifyOtpBloc>().add(
            VerifyOtpButtonclickEvent(
              user: VerifyOtpmodel(
                userId: widget.customerId,
                userLoginOTP: _currentOtp,
                userFullName: nameController.text,
                userOccupation: selectedUserType,
                pushToken:pushtoken,
              ),
            ),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and enter valid OTP')),
      );
    }
  }

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
              height: ResponsiveUtils.hp(37),
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

                  // Full Name Field
                  TextStyles.medium(
                    text: 'Enter your full name',
                  ),
                  ResponsiveSizedBox.height10,
                  CustomEditingTextfield(
                    controller: nameController,
                    hinttext: 'Enter full name',
                  ),

                  ResponsiveSizedBox.height20,

                  // User Type Dropdown
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
                        _validateForm();
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a user type' : null,
                  ),

                  ResponsiveSizedBox.height20,

                  TextStyles.body(
                    text:
                        'We have sent a verification code to ${widget.mobileNumber}',
                    weight: FontWeight.w500,
                  ),
                  ResponsiveSizedBox.height20,

                  // OTP Input Field
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: _otpController,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveBorderWidth: .5,
                      activeBorderWidth: .7,
                      selectedBorderWidth: .9,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 48,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.grey.shade100,
                      selectedFillColor: Colors.white,
                      activeColor: Appcolors.kgreenColor,
                      inactiveColor: Appcolors.ksecondrycolor,
                      selectedColor: Appcolors.kgreenColor,
                    ),
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onCompleted: (value) {
                      if (!mounted) return;
                      setState(() {
                        _isOtpButtonEnabled = true;
                        _currentOtp = value;
                        _validateForm();
                      });
                    },
                    onChanged: (value) {
                      if (!mounted) return;
                      setState(() {
                        _currentOtp = value;
                        _isOtpButtonEnabled = value.length == 6;
                        _validateForm();
                      });
                    },
                  ),

                  // Resend OTP Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      BlocConsumer<ResendOtpBloc, ResendOtpState>(
                        listener: (context, state) {
                          if (state is ResendOtpSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('OTP sent successfully')),
                            );
                          } else if (state is ResendOtpErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return TextButton(
                            onPressed:
                                _resendTimer == 0 ? () => _resendOtp() : null,
                            child: TextStyles.body(
                              text: _resendTimer > 0
                                  ? 'Resend in $_resendTimer seconds'
                                  : 'Resend',
                              weight: FontWeight.w600,
                              color: _resendTimer > 0
                                  ? Colors.grey.shade500
                                  : Appcolors.kredColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  ResponsiveSizedBox.height10,

                  // Register Button with BlocConsumer
                  BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
                    listener: (context, state) {
                      if (state is VerifyOtpSuccessState) {
                        log('Registration successful');
                        // Navigate to main screen or show success message
                        CustomNavigation.pushReplaceWithTransition(
                          context,
                          ScreenMainPage(),
                        );
                      } else if (state is VerifyOtpErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is VerifyOtpLoadingState) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomSqureLoadingButton(
                            loading: SpinKitCircle(
                              size: 15,
                              color: Appcolors.kgreenColor,
                            ),
                            color: Appcolors.kwhiteColor,
                          ),
                        );
                      }

                      return CustomSqureButton(
                        ontap:
                            _isFormValid ? () => _handleRegistration() : null,
                        text: 'Register',
                        color: _isFormValid
                            ? Appcolors.kgreenColor
                            : Colors.grey.shade400,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
