import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/domain/controllers/push_notificationcontroller.dart';
import 'package:e_naam/presentation/screens/drawer_pages/about_app_page.dart';
import 'package:e_naam/presentation/screens/drawer_pages/contactus_page.dart';
import 'package:e_naam/presentation/screens/screen_happycustomers/screen_happycustomers.dart';
import 'package:e_naam/presentation/screens/screen_homepage/widgets/logout_dialog.dart';
import 'package:e_naam/presentation/screens/screen_loginpage/screen_loginpage.dart';
import 'package:e_naam/presentation/screens/screen_offerspage/screen_offerspage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Appcolors.kwhiteColor,
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
              'Menu',
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
          icon: Icons.local_offer_outlined,
          title: 'Offers',
          onTap: () {
            CustomNavigation.pushWithTransition(context, ScreenOffersPage());
          },
        ),
        const Divider(height: 1),
        _buildMenuTile(
          icon: Icons.people_alt_outlined,
          title: 'Happy Clients',
          onTap: () {
            CustomNavigation.pushWithTransition(
                context, ScreenHappycustomersPage());
          },
        ),
        const Divider(height: 1),
        _buildMenuTile(
          icon: Icons.shopping_bag_outlined,
          title: 'Privacy Policy',
          onTap: () {
            _launchURL('https://enaam.app/home/privacy');
          },
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

        // _buildMenuTile(
        //   icon: Icons.question_answer_outlined,
        //   title: 'FAQs',
        //   onTap: () {},
        // ),
        // const Divider(height: 1),

        _buildMenuTile(
          icon: Icons.mail_outline,
          title: 'Contact Us',
          onTap: () {
            CustomNavigation.pushWithTransition(context, ContactUsPage());
          },
        ),
        const Divider(height: 1),

        // _buildMenuTile(
        //   icon: Icons.rate_review_outlined,
        //   title: 'App Feedback',
        //   onTap: () {},
        // ),
        // const Divider(),
        _buildMenuTile(
          icon: Icons.logout,
          iconcolor: Appcolors.kredColor,
          title: 'Logout',
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return LogoutConfirmationDialog(onLogout: () async {
                    try {
                      await PushNotifications.instance.deleteDeviceToken();

                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ScreenLoginpage()),
                        (Route<dynamic> route) => false,
                      );
                    } catch (e) {
                      debugPrint("Error during logout :$e");
                    }
                  });
                });
          },
        ),
        const Divider(),
        Column(
          children: [
            SizedBox(
              height: ResponsiveUtils.hp(5),
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

  Widget _buildMenuTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap,
      Color? iconcolor = Appcolors.kgreenColor}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: iconcolor,
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

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackBar('Could not launch $url');
      }
    } catch (e) {
      _showErrorSnackBar('Error launching URL: $e');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
