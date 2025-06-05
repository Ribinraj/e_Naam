import 'dart:async';
import 'dart:developer';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/verify_otpmodel.dart';
import 'package:e_naam/presentation/blocs/resend_otp/resend_otp_bloc.dart';
import 'package:e_naam/presentation/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_sharedpreferences.dart';
import 'package:e_naam/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  final String customerId;

  final String mobileNumber;
  const OtpVerificationPage(
      {super.key, required this.customerId, required this.mobileNumber});

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
    // Cancel timer first
    _timer?.cancel();
    _timer = null;

    // Safe disposal of controller
    try {
      _otpController.dispose();
    } catch (e) {
      // Controller already disposed, ignore
    }

    super.dispose();
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
      _isButtonEnabled = false;
    });

    // Reset and restart the timer
    _resetResendTimer();

    // Call resend OTP API
    context
        .read<ResendOtpBloc>()
        .add(ResendOtpClickEvent(userId: widget.customerId));
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
                  TextStyles.headline(
                    text: 'Verification Code',
                  ),
                  ResponsiveSizedBox.height10,
                  TextStyles.body(
                      text:
                          'We have sent a verification code to ${widget.mobileNumber}',
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
                    onCompleted: (value) {
                      if (!mounted) return;
                      setState(() {
                        _isButtonEnabled = true;
                        _currentOtp = value;
                      });
                    },
                    onChanged: (value) {
                      if (!mounted) return;
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
                    child: BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
                      listener: (context, state) {
                        if (state is VerifyOtpSuccessState) {
                          log('success');
                          CustomNavigation.pushReplaceWithTransition(
                              context, ScreenMainPage());
                        } else if (state is VerifyOtpErrorState) {
                          SnackBar(content: Text(state.message));
                        }
                      },
                      builder: (context, state) {
                        if (state is VerifyOtpLoadingState) {
                          return CustomSqureLoadingButton(
                              loading: SpinKitCircle(
                                size: 15,
                                color: Appcolors.kgreenColor,
                              ),
                              color: Appcolors.kwhiteColor);
                        }
                        return ElevatedButton(
                          onPressed: _isButtonEnabled
                              ? () async {
                                  final pushtoken = await getPushToken();
                                  if (_currentOtp.length == 6) {
                                    context.read<VerifyOtpBloc>().add(
                                        VerifyOtpButtonclickEvent(
                                            user: VerifyOtpmodel(
                                                userId: widget.customerId,
                                                userLoginOTP: _currentOtp,
                                                pushToken: pushtoken)));
                                  } else {
                                    SnackBar(
                                      content: Text('Please enter valid OTP'),
                                    );
                                  }
                                }
                              : null,
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
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive OTP? ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      BlocConsumer<ResendOtpBloc, ResendOtpState>(
                        listener: (context, state) {
                          if (state is ResendOtpSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("OTP sent successfully")),
                            );
                          } else if (state is ResendOtpErrorState) {
                            SnackBar(content: Text(state.message));
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
