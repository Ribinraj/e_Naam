import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class ScreenHistoryPage extends StatefulWidget {
  const ScreenHistoryPage({super.key});

  @override
  State<ScreenHistoryPage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ScreenHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kprimarycolor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ResponsiveSizedBox.height30,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF2A2A3A),
              ),
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'POINTS HISTORY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Divider(
                    color: Colors.pink,
                    thickness: 3,
                    endIndent: 130,
                  ),
                ],
              ),
            ),
            ResponsiveSizedBox.height20,
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Appcolors.kwhiteColor,
              ),
              height: ResponsiveUtils.hp(70),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: .5, color: Appcolors.ksecondrycolor))),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyles.body(
                                color: Appcolors.kblackColor,
                                text: 'Earned',
                              ),
                              ResponsiveSizedBox.height5,
                              TextStyles.caption(text: '04/06/2025')
                            ],
                          ),
                          const Spacer(),
                          TextStyles.body(
                              text: '+50', color: Appcolors.kgreenColor)
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
