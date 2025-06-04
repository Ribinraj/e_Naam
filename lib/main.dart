import 'dart:io';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/domain/controllers/push_notificationcontroller.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:e_naam/firebase_options.dart';
import 'package:e_naam/presentation/blocs/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_notification/fetch_notification_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_product_blac/fetch_product_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_profile/fetch_profile_bloc.dart';
import 'package:e_naam/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_banners/fetch_banners_bloc.dart';
import 'package:e_naam/presentation/blocs/qr_code_bloc/qr_code_bloc.dart';
import 'package:e_naam/presentation/blocs/redeem_request_bloc/redeem_request_bloc.dart';

import 'package:e_naam/presentation/blocs/resend_otp/resend_otp_bloc.dart';
import 'package:e_naam/presentation/blocs/send_otp/send_otp_bloc.dart';
import 'package:e_naam/presentation/blocs/update_profile/update_profile_bloc.dart';
import 'package:e_naam/presentation/blocs/verify_otp/verify_otp_bloc.dart';

import 'package:e_naam/presentation/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  final pushNotifications = PushNotifications();
  await pushNotifications.init();
    if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUtils().init(context);
    final loginrepo = Loginrepo();
    final productrepo = Productrepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SendOtpBloc(repository: loginrepo),
        ),
        BlocProvider(
          create: (context) => VerifyOtpBloc(repository: loginrepo),
        ),
        BlocProvider(
          create: (context) => ResendOtpBloc(repository: loginrepo),
        ),
        BlocProvider(
          create: (context) => FetchBannersBloc(repository: productrepo),
        ),
           BlocProvider(
          create: (context) => FetchProfileBloc(repository:loginrepo),
        ),
            BlocProvider(
          create: (context) => UpdateProfileBloc(repository:loginrepo),
        ),
               BlocProvider(
          create: (context) =>QrCodeBloc(repository:loginrepo),
        ),
                BlocProvider(
          create: (context) =>FetchCategoriesBloc(repository:productrepo),
        ),
               BlocProvider(
          create: (context) =>FetchProductBloc(repository:productrepo),
        ),
                  BlocProvider(
          create: (context) =>RedeemRequestBloc(repository:productrepo),
        ),
                    BlocProvider(
          create: (context) =>FetchNotificationBloc(repository:productrepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'e_Naam',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: Appcolors.kwhiteColor),
       // home: ScreenLoginpage(),
        home: const SplashScreen(),
      ),
    );
  }
}
