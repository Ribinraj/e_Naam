import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:e_naam/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:e_naam/presentation/blocs/send_otp/send_otp_bloc.dart';

import 'package:e_naam/presentation/screens/screen_loginpage/screen_loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUtils().init(context);
    final loginrepo = Loginrepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SendOtpBloc(repository: loginrepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'e_Naam',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: Appcolors.kwhiteColor),
        home: const ScreenLoginpage(),
      ),
    );
  }
}
