// import 'package:e_naam/core/appconstants.dart';
// import 'package:e_naam/core/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AboutAppPage extends StatelessWidget {
//   const AboutAppPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("About eNaam"),
//         foregroundColor: Appcolors.kwhiteColor,
//         backgroundColor: Appcolors.kprimarycolor,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(
//                 Appconstants.logo,
//                 height: 100,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: Text(
//                 "Welcome to eNaam!",
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Appcolors.korangeColor,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "eNaam is your smart way to earn and redeem rewards seamlessly. "
//               "With just a QR scan, you can collect points and use them to get exciting offers and products.",
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
//               textAlign: TextAlign.justify,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "🎯 How It Works",
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Appcolors.korangeColor,
//               ),
//             ),
//             const SizedBox(height: 8),
//             bulletPoint("Earn points by scanning QR codes."),
//             bulletPoint("Check your point balance anytime."),
//             bulletPoint("Redeem rewards once you have enough points."),
//             const SizedBox(height: 20),
//             Center(
//               child: Text(
//                 "Start scanning. Start redeeming.",
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontStyle: FontStyle.italic,
//                   color: Appcolors.ksecondrycolor,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: Text(
//                 "Version 1.0.0 • © 2025 eNaam",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget bulletPoint(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, bottom: 6),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("• ", style: TextStyle(fontSize: 18)),
//           Expanded(
//             child: Text(
//               text,
//               style: GoogleFonts.poppins(fontSize: 15),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
