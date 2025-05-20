import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/responsive_utils.dart';
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
        'imageUrl': 'https://example.com/laptop.jpg',
      },
      {
        'name': 'Headphones',
        'imageUrl': 'https://example.com/headphones.jpg',
      },
      {
        'name': 'Smart Watches',
        'imageUrl': 'https://example.com/smartwatch.jpg',
      },
      {
        'name': 'Cameras',
        'imageUrl': 'https://example.com/camera.jpg',
      },
      {
        'name': 'Tablets',
        'imageUrl': 'https://example.com/tablet.jpg',
      },
      {
        'name': 'Gaming',
        'imageUrl': 'https://example.com/gaming.jpg',
      },
      {
        'name': 'Speakers',
        'imageUrl': 'https://example.com/speaker.jpg',
      },
      {
        'name': 'Accessories',
        'imageUrl': 'https://example.com/accessories.jpg',
      },
      {
        'name': 'Smart Home',
        'imageUrl': 'https://example.com/smarthome.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        backgroundColor: Appcolors.kprimarycolor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.all(16),
            color: Appcolors.kprimarycolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
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
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Appcolors.ksecondrycolor.withOpacity(0.2),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.wp(3.5),
                      fontWeight: FontWeight.w500,
                      color: Appcolors.kprimarycolor,
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
