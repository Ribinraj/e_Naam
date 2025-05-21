import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample category data - replace with your actual data
    final List<Map<String, String>> categories = [
      {
        'name': 'Mobile Phones',
        'imageUrl':
            'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
      },
      {
        'name': 'Laptops',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.MYeJ6rOR5Rrkg-JMz3J4rgHaHa&pid=Api&P=0&h=180',
      },
      {
        'name': 'Headphones',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.MYeJ6rOR5Rrkg-JMz3J4rgHaHa&pid=Api&P=0&h=180',
      },
      {
        'name': 'Smart Watches',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.eVtLF7NyVlJO2nE6WTljbgHaFw&pid=Api&P=0&h=180',
      },
      {
        'name': 'Cameras',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.eVtLF7NyVlJO2nE6WTljbgHaFw&pid=Api&P=0&h=180',
      },
      {
        'name': 'Tablets',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.MYeJ6rOR5Rrkg-JMz3J4rgHaHa&pid=Api&P=0&h=180',
      },
      {
        'name': 'Gaming',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.eVtLF7NyVlJO2nE6WTljbgHaFw&pid=Api&P=0&h=180',
      },
      {
        'name': 'Speakers',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.eVtLF7NyVlJO2nE6WTljbgHaFw&pid=Api&P=0&h=180',
      },
      {
        'name': 'Accessories',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.MYeJ6rOR5Rrkg-JMz3J4rgHaHa&pid=Api&P=0&h=180',
      },
      {
        'name': 'Smart Home',
        'imageUrl':
            'https://tse4.mm.bing.net/th?id=OIP.MYeJ6rOR5Rrkg-JMz3J4rgHaHa&pid=Api&P=0&h=180',
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 247, 243),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.all(10),
            color: Appcolors.kprimarycolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveSizedBox.height30,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          CustomNavigation.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Appcolors.kwhiteColor,
                        )),
                    ResponsiveSizedBox.width20,
                    Text(
                      'Explore Categories',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.wp(6),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Find your favorite products in our curated categories',
                  style: TextStyle(
                    fontSize: ResponsiveUtils.wp(3.5),
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                ResponsiveSizedBox.height30
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    name: categories[index]['name'] ?? '',
                    imageUrl: categories[index]['imageUrl'] ?? '',
                    onTap: () {
                      // Handle category tap
                      print('Tapped on ${categories[index]['name']}');
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: ImageWithFallback(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Appcolors.kprimarycolor,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.wp(3.5),
                      fontWeight: FontWeight.w500,
                      color: Appcolors.ksecondrycolor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
