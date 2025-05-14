import 'dart:async';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonEnabled = false;
  int _resendTimer = 30;
  Timer? _timer;
  String _currentOtp = '';

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    setState(() {
      _resendTimer = 30;
    });
    _startResendTimer();
  }

  // void _verifyOtp() {
  //   setState(() {
  //     _isVerifying = true;
  //   });

  //   // Simulate verification process
  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (_currentOtp.length == 6) {
  //       // For demo purpose, any 6-digit code is considered valid
  //       _showSuccessDialog();
  //     } else {
  //       _showErrorDialog();
  //     }

  //     setState(() {
  //       _isVerifying = false;
  //     });
  //   });
  // }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('OTP verification successful!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to the next screen or perform required action
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Invalid OTP. Please try again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
              height: ResponsiveUtils.hp(50),
              width: ResponsiveUtils.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: ResponsiveUtils.hp(30),
                    width: ResponsiveUtils.wp(70),
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
                  TextStyles.headline(
                    text: 'Verification Code',
                  ),
                  ResponsiveSizedBox.height10,
                  TextStyles.body(
                      text: 'We have sent a verification code to 9946802969',
                      weight: FontWeight.w500),
                  ResponsiveSizedBox.height20,
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
                    onCompleted: (v) {
                      setState(() {
                        _isButtonEnabled = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _currentOtp = value;
                        _isButtonEnabled = value.length == 6;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.kgreenColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                      TextButton(
                        onPressed: _resendTimer == 0
                            ? () {
                                // Resend OTP logic would go here
                                _resetResendTimer();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('OTP has been resent!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            : null,
                        child: Text(
                          _resendTimer > 0
                              ? 'Resend in $_resendTimer seconds'
                              : 'Resend',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _resendTimer > 0
                                ? Colors.grey.shade500
                                : Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ],
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
