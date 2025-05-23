import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/customdrawer.dart';

import 'package:flutter/material.dart';

class ScreenHomepage extends StatefulWidget {
  const ScreenHomepage({super.key});

  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  bool? isNew;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Appcolors.kprimarycolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveSizedBox.height50,
                          Row(
                            children: [
                              TextStyles.subheadline(
                                  text: 'Hello Ribin',
                                  color: Appcolors.kwhiteColor),
                              const Spacer(),
                              Builder(builder: (context) {
                                return GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    child: const Icon(
                                      Icons.menu,
                                      color: Appcolors.kwhiteColor,
                                    ));
                              }),
                            ],
                          ),
                          ResponsiveSizedBox.height30,
                          _buildPointsValueSection(),
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveSizedBox.height20,
                        _buildFlyerOffersSection(),

                        ResponsiveSizedBox.height20,
                        // Stores & Contacts Section
                        _buildStoresContactsSection(),
                        ResponsiveSizedBox.height20,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsValueSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 40, 37, 58),
            Color(0xFF242438),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: CustomPaint(
        painter: PointsBackgroundPainter(),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveSizedBox.height10,
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 141, 113, 74),
                          Color(0xFFFFC149),
                        ],
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    ResponsiveSizedBox.width10,
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 169, 141, 100),
                          Color(0xFFFFC149),
                        ],
                      ).createShader(bounds),
                      child: TextStyles.subheadline(
                        text: '500 Points',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ResponsiveSizedBox.height20,
                TextStyles.medium(
                  text: 'Redeem your points now!',
                  color: Appcolors.kwhiteColor,
                ),
                ResponsiveSizedBox.height20
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                navigateToMainPage(context, 3);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: .5,
                      color: Appcolors.ksecondrycolor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TextStyles.medium(
                    text: 'Redeem Now',
                    color: Appcolors.ksecondrycolor,
                    weight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFlyerOffersSection() {
    // Sample data for carousel items
    final List<Map<String, dynamic>> offerItems = List.generate(
      10,
      (index) => {
        'image':
            "https://c8.alamy.com/comp/F6NBD8/various-type-of-plumbing-tools-against-white-background-F6NBD8.jpg",
        'expiryText': index % 2 == 0 ? "Expires Today" : "Expires in 3 days",
        'isNew': index % 3 == 0,
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: offerItems.length,
          options: CarouselOptions(
            height: 190,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildOfferCard(
              image: offerItems[index]['image'],
              expiryText: offerItems[index]['expiryText'],
              isNew: offerItems[index]['isNew'],
            );
          },
        ),
      ],
    );
  }

  Widget _buildOfferCard({
    required String image,
    required String expiryText,
    required bool isNew,
  }) {
    // Get screen width to make the card full width
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width -
              32, // Full width minus padding
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF2A2A3A),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(.3),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        image,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.grey,
                            child: const Center(
                              child: Icon(Icons.error, color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (isNew)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextStyles.medium(
                    text: 'Plumping tools', color: Appcolors.ksecondrycolor),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildStoresContactsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stores & Contacts',
          style: TextStyle(
            color: Appcolors.kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ResponsiveSizedBox.height10,
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Container(
                height: ResponsiveUtils.hp(27),
                width: double.infinity,
                color: Appcolors.kprimarycolor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'STORES & CONTACT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      color: Appcolors.ksecondrycolor,
                      thickness: 3,
                      endIndent: 130,
                    ),
                    ResponsiveSizedBox.height20,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 231, 231, 231),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.phone,
                            size: 12,
                            color: Appcolors.kgreenColor,
                          ),
                        ),
                        ResponsiveSizedBox.width10,
                        TextStyles.medium(
                            text: '9946802969', color: Appcolors.kwhiteColor),
                      ],
                    ),
                    ResponsiveSizedBox.height20,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 231, 231, 231),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.mail_outline,
                            size: 12,
                            color: Appcolors.kgreenColor,
                          ),
                        ),
                        ResponsiveSizedBox.width10,
                        TextStyles.medium(
                            text: 'ribinrajop@gmail.com',
                            color: Appcolors.kwhiteColor),
                      ],
                    ),
                    ResponsiveSizedBox.height20,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 231, 231, 231),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.location_on,
                            size: 12,
                            color: Appcolors.kgreenColor,
                          ),
                        ),
                        ResponsiveSizedBox.width10,
                        TextStyles.medium(
                            text: 'mysuru,karnatak,670089',
                            color: Appcolors.kwhiteColor),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PointsBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a paint for drawing circles
    // final Paint circlePaint = Paint()
    //   ..color = Colors.white.withOpacity(0.05)
    //   ..style = PaintingStyle.fill;

    // Draw decorative circles
    // canvas.drawCircle(
    //   Offset(size.width * 0.1, size.height * 0.8),
    //   size.width * 0.15,
    //   circlePaint,
    // );

    // canvas.drawCircle(
    //   Offset(size.width * 0.85, size.height * 0.2),
    //   size.width * 0.1,
    //   circlePaint,
    // );

    // Draw dotted pattern
    final Paint dotPaint = Paint()
      ..color = Colors.white.withOpacity(0.07)
      ..style = PaintingStyle.fill;

    final double dotSize = 3;
    final double spacing = 15;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        if ((x + y) % (spacing * 2) == 0) {
          canvas.drawCircle(Offset(x, y), dotSize, dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
