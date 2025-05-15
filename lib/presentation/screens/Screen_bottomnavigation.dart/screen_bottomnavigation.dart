// import 'package:e_naam/presentation/blocs/bloc/bottom_navigation_bloc.dart';
// import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/widgets/custom_navbar.dart';
// import 'package:e_naam/presentation/screens/screen_historypage/screen_historypage.dart';
// import 'package:e_naam/presentation/screens/screen_homepage/screen_homepage.dart';
// import 'package:e_naam/presentation/screens/screen_profileppage/screen_profilepage.dart';
// import 'package:e_naam/presentation/screens/screen_redeem/screen_redeem.dart';
// import 'package:e_naam/presentation/screens/screen_scanpage/screen_scanpage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScreenMainPage extends StatefulWidget {
//   const ScreenMainPage({super.key});

//   @override
//   State<ScreenMainPage> createState() => _ScreenMainPageState();
// }

// class _ScreenMainPageState extends State<ScreenMainPage> {
//   final List<Widget> _pages = [
//     ScreenHomepage(),
//     ScreenHistoryPage(),
//     ScreenScanpage(),
//     ScreenRedeemPage(),
//     ScreenProfilePage()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
//       builder: (context, state) {
//         return
//            Scaffold(
//             //backgroundColor: const Color.fromARGB(255, 248, 232, 227),
//             body: _pages[state.currentPageIndex],
//             bottomNavigationBar: const BottomNavigationWidget(),

//         );
//       },
//     );
//   }
// }
import 'package:e_naam/presentation/blocs/bloc/bottom_navigation_bloc.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/widgets/custom_navbar.dart';

import 'package:e_naam/presentation/screens/screen_historypage/screen_historypage.dart';
import 'package:e_naam/presentation/screens/screen_homepage/screen_homepage.dart';

import 'package:e_naam/presentation/screens/screen_profileppage/screen_profilepage.dart';
import 'package:e_naam/presentation/screens/screen_redeem/screen_redeem.dart';
import 'package:e_naam/presentation/screens/screen_scanpage/screen_scanpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenMainPage extends StatefulWidget {
  const ScreenMainPage({super.key});

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {
  final List<Widget> _pages = [
    const ScreenHomepage(),
   // OtpVerificationPage(),
    const ScreenHistoryPage(),
    const ScreenScanpage(),
    const ScreenRedeemPage(),
    const ScreenProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentPageIndex,
            children: _pages,
          ),
          extendBody: true,
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
