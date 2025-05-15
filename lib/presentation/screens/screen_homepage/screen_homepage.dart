import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      color: Appcolors.kprimarycolor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveSizedBox.height50,
                          TextStyles.subheadline(
                              text: 'Hello,\nRibin',
                              color: Appcolors.kwhiteColor),
                          ResponsiveSizedBox.height30,
                          _buildPointsValueSection(),
                          ResponsiveSizedBox.height(5),
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFlyerOffersSection(),

                        ResponsiveSizedBox.height20,
                        // Stores & Contacts Section
                        _buildStoresContactsSection(),
                        ResponsiveSizedBox.height10,
                        TextStyles.body(
                            text: 'If you require help please contact us.',
                            weight: FontWeight.bold),
                        ResponsiveSizedBox.height10,
                        TextStyles.caption(
                            text:
                                'Our service hours are 9:00 am to 10:00 pm. If you send us am email or a physical document we will respond within 2-3 business days.',
                            color: Appcolors.kblackColor),
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
                                size: 18,
                                color: Appcolors.kgreenColor,
                              ),
                            ),
                            ResponsiveSizedBox.width10,
                            TextStyles.medium(text: '9946802969'),
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
                                size: 18,
                                color: Appcolors.kgreenColor,
                              ),
                            ),
                            ResponsiveSizedBox.width10,
                            TextStyles.medium(text: 'ribinrajop@gmail.com'),
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
                                size: 18,
                                color: Appcolors.kgreenColor,
                              ),
                            ),
                            ResponsiveSizedBox.width10,
                            TextStyles.medium(text: 'mysuru,karnatak,670089'),
                          ],
                        ),
                        ResponsiveSizedBox.height(15)
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 48, 48, 70),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _buildPointsValueItem(
            icon: Icons.emoji_events,
            iconColor: Colors.amber,
            title: 'Points',
            value: '0',
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          _buildPointsValueItem(
            icon: Icons.account_balance_wallet,
            iconColor: Colors.amber,
            title: 'Value',
            value: '₹ 0',
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.bar_chart,
              color: Appcolors.ksecondrycolor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildPointsValueItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style:
                const TextStyle(color: Appcolors.ksecondrycolor, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFlyerOffersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Flyer Offers',
              style: TextStyle(
                color: Appcolors.kblackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Text(
                    'VIEW ALL',
                    style: TextStyle(
                      color: Color.fromARGB(255, 67, 67, 67),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {},
                  child: _buildOfferCard(
                    image:
                        "https://c8.alamy.com/comp/F6NBD8/various-type-of-plumbing-tools-against-white-background-F6NBD8.jpg",
                    expiryText:
                        index % 2 == 0 ? "Expires Today" : "Expires in 3 days",
                    isNew: index % 3 == 0, // Make every third item "NEW"
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard({
    required String image,
    required String expiryText,
    required bool isNew,
  }) {
    return Container(
      width: 180, // Fixed width for each card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF2A2A3A),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  image,
                  height: 120,
                  width: 180, // Match the container width
                  fit: BoxFit.cover,
                  // Add error handling to prevent null errors when image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: 180,
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              if (isNew)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    expiryText,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                height: 150,
                width: double.infinity,
                color: Appcolors.kprimarycolor,
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STORES & CONTACT',
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
              Positioned(
                bottom: 8,
                left: 20,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      'Until 31 May, 2027',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
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
