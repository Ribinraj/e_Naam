// // import 'package:e_naam/core/colors.dart';
// // import 'package:e_naam/core/responsive_utils.dart';
// // import 'package:e_naam/presentation/blocs/bloc/bottom_navigation_bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:solar_icons/solar_icons.dart';

// // class BottomNavigationWidget extends StatelessWidget {
// //   const BottomNavigationWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
// //       builder: (context, state) {
// //         return BottomNavigationBar(
// //           currentIndex: state.currentPageIndex,
// //           onTap: (index) {
// //             context.read<BottomNavigationBloc>().add(
// //                   NavigateToPageEvent(pageIndex: index),
// //                 );
// //           },
// //           type: BottomNavigationBarType.fixed,
// //           backgroundColor: Appcolors.kwhiteColor,
// //           selectedItemColor: Appcolors.kblackColor,
// //           unselectedItemColor: Appcolors.kprimarycolor.withOpacity(.8),
// //           selectedIconTheme: const IconThemeData(
// //             color: Appcolors.kblackColor,
// //           ),
// //           unselectedIconTheme:
// //               IconThemeData(color: Appcolors.kprimarycolor.withOpacity(.8)),
// //           selectedLabelStyle: const TextStyle(fontSize: 10),
// //           unselectedLabelStyle: const TextStyle(fontSize: 10),
// //           items: [
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 SolarIconsOutline.home,
// //                 size: ResponsiveUtils.wp(5),
// //               ),
// //               label: 'Home',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 SolarIconsOutline.cartLargeMinimalistic,
// //                 size: ResponsiveUtils.wp(6),
// //               ),
// //               label: 'History',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 SolarIconsOutline.clipboardHeart,
// //                 size: ResponsiveUtils.wp(6),
// //               ),
// //               label: 'Scanning',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 SolarIconsOutline.user,
// //                 size: ResponsiveUtils.wp(6),
// //               ),
// //               label: 'redeem',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 SolarIconsOutline.user,
// //                 size: ResponsiveUtils.wp(6),
// //               ),
// //               label: 'Profile',
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:e_naam/core/colors.dart';
// import 'package:e_naam/core/responsive_utils.dart';
// import 'package:e_naam/presentation/blocs/bloc/bottom_navigation_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
//       builder: (context, state) {
//         return Container(
//           height: kBottomNavigationBarHeight + 15,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(color: Colors.grey.shade200, width: 1.0),
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               // Main nav bar with items
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildNavItem(
//                     context,
//                     0,
//                     state.currentPageIndex,
//                     Icons.home_outlined,
//                     'Home'
//                   ),
//                   _buildNavItem(
//                     context,
//                     1,
//                     state.currentPageIndex,
//                     Icons.history,
//                     'History'
//                   ),
//                   // Empty space for center button
//                   SizedBox(width: ResponsiveUtils.wp(20)),
//                   _buildNavItem(
//                     context,
//                     3,
//                     state.currentPageIndex,
//                     Icons.confirmation_number_outlined,
//                     'Vouchers'
//                   ),
//                   _buildNavItem(
//                     context,
//                     4,
//                     state.currentPageIndex,
//                     Icons.person_outline,
//                     'Profile'
//                   ),
//                 ],
//               ),

//               // Center circular button
//               Positioned(
//                 top: -22,
//                 child: GestureDetector(
//                   onTap: () {
//                     context.read<BottomNavigationBloc>().add(
//                       NavigateToPageEvent(pageIndex: 2),
//                     );
//                   },
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 5,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Container(
//                         width: 30,
//                         height: 30,
//                         child: Image.asset(
//                           'assets/images/shopping_bag.png',
//                           color: Colors.white,
//                         ),
//                         // If you don't have the specific icon as an asset,
//                         // use an Icon as fallback:
//                         // child: Icon(
//                         //   Icons.shopping_bag_outlined,
//                         //   color: Colors.white,
//                         //   size: 30,
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               // Scan barcode overlay (visible in scan button)
//               Positioned(
//                 top: -5, // Adjust as needed
//                 child: Container(
//                   width: 34,
//                   height: 24,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(4),
//                     border: Border.all(color: Colors.red, width: 2),
//                   ),
//                   child: Center(
//                     child: Container(
//                       height: 2,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildNavItem(
//     BuildContext context,
//     int index,
//     int currentIndex,
//     IconData icon,
//     String label,
//   ) {
//     final bool isSelected = index == currentIndex;

//     return InkWell(
//       onTap: () {
//         context.read<BottomNavigationBloc>().add(
//           NavigateToPageEvent(pageIndex: index),
//         );
//       },
//       child: Container(
//         width: ResponsiveUtils.wp(18),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 24,
//               color: isSelected ? Colors.green : Colors.grey,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: isSelected ? Colors.green : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/presentation/blocs/bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Container(
          height: 80,
          color: Colors.transparent,
          child: Stack(
            children: [
              // Main navigation bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 53,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        context,
                        0,
                        state.currentPageIndex,
                        SolarIconsOutline.starsMinimalistic,
                        'Home',
                      ),
                      _buildNavItem(
                        context,
                        1,
                        state.currentPageIndex,
                        SolarIconsOutline.transferHorizontal,
                        'History',
                      ),
                      // Empty space for center button
                      const SizedBox(width: 60),
                      _buildNavItem(
                        context,
                        3,
                        state.currentPageIndex,
                        SolarIconsOutline.cardReceive,
                        'Redeem',
                      ),
                      _buildNavItem(
                        context,
                        4,
                        state.currentPageIndex,
                        SolarIconsOutline.userHands,
                        'Profile',
                      ),
                    ],
                  ),
                ),
              ),

              // Center scan button
              Positioned(
                left: 0,
                right: 0,
                bottom: 17,
                child: Center(
                  child: FloatingActionButton(
                    shape: CircleBorder(),
                    backgroundColor: Colors.red,
                    elevation: 4,
                    onPressed: () {
                      context.read<BottomNavigationBloc>().add(
                            NavigateToPageEvent(pageIndex: 2),
                          );
                    },
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          SolarIconsOutline.qrCode,
                          color: Colors.white,
                          size: 28,
                        ),
                        // Barcode scanner overlay
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    int currentIndex,
    IconData icon,
    String label,
  ) {
    final bool isSelected = index == currentIndex;
    final Color activeColor = Colors.green;
    final Color inactiveColor = Appcolors.ksecondrycolor;

    return InkWell(
      onTap: () {
        context.read<BottomNavigationBloc>().add(
              NavigateToPageEvent(pageIndex: index),
            );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? activeColor : inactiveColor,
            size: 19,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
