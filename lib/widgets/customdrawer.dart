import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Appcolors.kprimarycolor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: ResponsiveUtils.wp(30),
                height: ResponsiveUtils.hp(15),
                child: Center(
                  child: TextStyles.subheadline(
                      text: 'e_Naam', color: Appcolors.kwhiteColor),
                ),
                // child: Image.asset(
                //   Appconstants.logo,
                //   fit: BoxFit.contain,
                // ),
              ),
            ],
          ),
        ),
  
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'e_Naam',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),

        // Menu items
        _buildMenuTile(
          icon: Icons.star_border_outlined,
          title: 'About e_Naam',
          onTap: () {},
        ),
        const Divider(height: 1),

        _buildMenuTile(
          icon: Icons.shopping_bag_outlined,
          title: 'Privacy Policy',
          onTap: () {},
        ),
        const Divider(height: 1),

        // App section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'App',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),

        _buildMenuTile(
          icon: Icons.question_answer_outlined,
          title: 'FAQs',
          onTap: () {},
        ),
        const Divider(height: 1),

        _buildMenuTile(
          icon: Icons.mail_outline,
          title: 'Contact Us',
          onTap: () {},
        ),
        const Divider(height: 1),

        _buildMenuTile(
          icon: Icons.rate_review_outlined,
          title: 'App Feedback',
          onTap: () {},
        ),
        const Divider(),
        Column(
          children: [
            SizedBox(
              height: ResponsiveUtils.hp(12),
            ),
            TextStyles.caption(text: 'Designed & Developed by'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStyles.caption(
                    text: 'Crisant Technologies', weight: FontWeight.w600),
                TextStyles.caption(text: ', Mysuru'),
              ],
            )
          ],
        ),
      ],
    ));
  }

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
}
