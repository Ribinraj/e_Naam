// import 'package:e_naam/core/colors.dart';
// import 'package:e_naam/core/constants.dart';
// import 'package:e_naam/core/responsive_utils.dart';
// import 'package:e_naam/presentation/screens/edit_profile/edit_profilepage.dart';
// import 'package:e_naam/widgets/custom_navigator.dart';
// import 'package:flutter/material.dart';

// class ScreenProfilePage extends StatelessWidget {
//   const ScreenProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   backgroundColor:
//       //       const Color(0xFF1F2532), // Dark navy color from the image
//       //   toolbarHeight: 80,
//       //   title: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Row(
//       //         children: [
//       //           // Image.asset(
//       //           //   'assets/images/nesto_logo.png', // Replace with your logo
//       //           //   width: 30,
//       //           //   height: 30,
//       //           //   color: Colors.white,
//       //           // ),
//       //           const Spacer(),
//       //           Container(
//       //             padding: const EdgeInsets.all(4),
//       //             decoration: BoxDecoration(
//       //               shape: BoxShape.circle,
//       //               border: Border.all(color: Colors.white, width: 1),
//       //             ),
//       //             child: const Icon(
//       //               Icons.keyboard_arrow_down,
//       //               color: Colors.white,
//       //               size: 18,
//       //             ),
//       //           ),
//       //         ],
//       //       ),
//       //       const SizedBox(height: 5),
//       //       const Text(
//       //         '33/250-52, BYPASS ROAD, PERIN...',
//       //         style: TextStyle(
//       //           color: Colors.white,
//       //           fontSize: 12,
//       //           fontWeight: FontWeight.w400,
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       //   automaticallyImplyLeading: false,
//       // ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               color: const Color(0xFF1F2532), // Same dark navy color
//               height: ResponsiveUtils.hp(32),
//             ),
//             Transform.translate(
//               offset: const Offset(0, -50),
//               child: Column(
//                 children: [
//                   // Profile Avatar
//                   Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFD4A76A), // Gold color as in image
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.white, width: 3),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'R',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   // Name
//                   TextStyles.headline(
//                     text: 'Ribinraj',
//                   ),
//                   const SizedBox(height: 5),
//                   // Phone Number
//                   TextStyles.body(
//                       text: '+91 9946802969', weight: FontWeight.w400),
//                   const SizedBox(height: 20),
//                   // Edit Profile Button
//                   GestureDetector(
//                     onTap: () {
//                       CustomNavigation.pushWithTransition(
//                           context, ScreenEditProfilepage());
//                     },
//                     child: Container(
//                       width: 300,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade300),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.edit, size: 18),
//                           const SizedBox(width: 10),
//                           TextStyles.body(
//                               text: 'Edit Profile', weight: FontWeight.w500)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const Divider(height: 1),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper method to build menu tiles
//   Widget _buildMenuTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: Appcolors.kgreenColor,
//             ),
//             const SizedBox(width: 16),
//             TextStyles.body(
//               text: title,
//             ),
//             const Spacer(),
//             Icon(
//               Icons.chevron_right,
//               color: Colors.grey.shade400,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/update_profilemodel.dart';

import 'package:e_naam/presentation/blocs/fetch_profile/fetch_profile_bloc.dart';

import 'package:e_naam/presentation/screens/edit_profile/edit_profilepage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenProfilePage extends StatefulWidget {
  const ScreenProfilePage({super.key});

  @override
  State<ScreenProfilePage> createState() => _ScreenProfilePageState();
}

class _ScreenProfilePageState extends State<ScreenProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchProfileBloc>().add(FetchProfileInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FetchProfileBloc, FetchProfileState>(
        builder: (context, state) {
          if (state is FetchProfileLoadingState) {
            return Center(
              child: SpinKitCircle(
                size: 35,
                color: Appcolors.ksecondrycolor,
              ),
            );
          }
          if (state is FetchProfileSuccessState) {
            final user = state.profile;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFF1F2532), // Dark navy color
                    height: ResponsiveUtils.hp(25),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -50),
                    child: Column(
                      children: [
                        // Profile Avatar
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4A76A), // Gold color
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: Center(
                            child: Text(
                              user.userFullName.isNotEmpty
                                  ? user.userFullName[0]
                                  : "E",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Name
                        TextStyles.headline(
                          text: user.userFullName,
                        ),
                        const SizedBox(height: 5),
                        // Phone Number
                        TextStyles.body(
                            text: user.userMobileNumber,
                            weight: FontWeight.w400),
                        const SizedBox(height: 5),
                        // Occupation
                        TextStyles.body(
                            text: user.userOccupation,
                            weight: FontWeight.w400,
                            color: Colors.grey.shade700),
                        const SizedBox(height: 8),
                        // Edit Profile Button
                        GestureDetector(
                          onTap: () {
                            CustomNavigation.pushWithTransition(
                                context,
                                ScreenEditProfilepage(
                                  profile: UpdateProfilemodel(
                                      userFullName: user.userFullName,
                                      userOccupation: user.userOccupation,
                                      userUPIAddress: '6575',
                                      panCardID: user.panCardID,
                                      adharCardID: user.adharCardID,
                                      address: user.address,
                                      gst: user.gst),
                                ));
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.edit, size: 18),
                                const SizedBox(width: 10),
                                TextStyles.body(
                                    text: 'Edit Profile',
                                    weight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextStyles.body(
                                    text: 'Personal Information',
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                const Divider(height: 1),
                                _buildInfoTile(
                                  icon: Icons.home_outlined,
                                  title: 'Address',
                                  value: user.address,
                                ),
                                _buildInfoTile(
                                  icon: Icons.fingerprint_outlined,
                                  title: 'Aadhaar Number',
                                  value: user.adharCardID,
                                ),
                                _buildInfoTile(
                                  icon: Icons.credit_card_outlined,
                                  title: 'PAN Card',
                                  value: user.panCardID,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Business Information Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextStyles.body(
                                    text: 'Business Information',
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                const Divider(height: 1),
                                _buildInfoTile(
                                  icon: Icons.business_outlined,
                                  title: 'GST Number',
                                  value: user.gst,
                                ),
                                _buildInfoTile(
                                  icon: Icons.account_balance_wallet_outlined,
                                  title: 'UPI Address',
                                  value: 'need update api',
                                ),
                                ResponsiveSizedBox.height50
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FetchProfileErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  // Helper method to build menu tiles
  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F5F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1F2532),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyles.body(
                  text: title,
                  color: Colors.grey.shade600,
                  weight: FontWeight.w400,
                ),
                const SizedBox(height: 4),
                TextStyles.body(
                  text: value,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
