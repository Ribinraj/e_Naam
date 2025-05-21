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
import 'package:e_naam/presentation/screens/edit_profile/edit_profilepage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';

class ScreenProfilePage extends StatelessWidget {
  const ScreenProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                    child: const Center(
                      child: Text(
                        'R',
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
                    text: 'Ribinraj',
                  ),
                  const SizedBox(height: 5),
                  // Phone Number
                  TextStyles.body(
                      text: '+91 9946802969', weight: FontWeight.w400),
                  const SizedBox(height: 5),
                  // Occupation
                  TextStyles.body(
                      text: 'Dealer',
                      weight: FontWeight.w400,
                      color: Colors.grey.shade700),
                  const SizedBox(height: 8),
                  // Edit Profile Button
                  GestureDetector(
                    onTap: () {
                      CustomNavigation.pushWithTransition(
                          context, const ScreenEditProfilepage());
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
                              text: 'Edit Profile', weight: FontWeight.w500)
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
                            value:
                                '33/250-52, BYPASS ROAD, PERINTHALMANNA, KERALA',
                          ),
                          _buildInfoTile(
                            icon: Icons.fingerprint_outlined,
                            title: 'Aadhaar Number',
                            value: '4444 6875 4582',
                          ),
                          _buildInfoTile(
                            icon: Icons.credit_card_outlined,
                            title: 'PAN Card',
                            value: 'ABCDE1234F',
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
                            value: '29ABCDE1234F1Z5',
                          ),
                          _buildInfoTile(
                            icon: Icons.account_balance_wallet_outlined,
                            title: 'UPI Address',
                            value: 'ribinraj@upi',
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
      ),
    );
  }

  // Helper method to build menu tiles
  // ignore: unused_element
  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Appcolors.kgreenColor,
            ),
            const SizedBox(width: 16),
            TextStyles.body(
              text: title,
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build information tiles
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
            // // Section title - INAAM
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'e_Naam',
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.grey.shade700,
            //       ),
            //     ),
            //   ),
            // ),

            // // Menu items
            // _buildMenuTile(
            //   icon: Icons.star_border_outlined,
            //   title: 'About e_Naam',
            //   onTap: () {},
            // ),
            // const Divider(height: 1),

            // _buildMenuTile(
            //   icon: Icons.shopping_bag_outlined,
            //   title: 'Privacy Policy',
            //   onTap: () {},
            // ),
            // const Divider(height: 1),

            // // App section title
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'App',
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.grey.shade700,
            //       ),
            //     ),
            //   ),
            // ),

            // _buildMenuTile(
            //   icon: Icons.question_answer_outlined,
            //   title: 'FAQs',
            //   onTap: () {},
            // ),
            // const Divider(height: 1),

            // _buildMenuTile(
            //   icon: Icons.mail_outline,
            //   title: 'Contact Us',
            //   onTap: () {},
            // ),
            // const Divider(height: 1),

            // _buildMenuTile(
            //   icon: Icons.rate_review_outlined,
            //   title: 'App Feedback',
            //   onTap: () {},
            // ),