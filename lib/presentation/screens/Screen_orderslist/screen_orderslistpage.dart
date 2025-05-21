// import 'package:e_naam/core/colors.dart';
// import 'package:flutter/material.dart';

// class OrdersListScreen extends StatelessWidget {
//   const OrdersListScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 253, 250, 246),
//       appBar: AppBar(
//         title: const Text(
//           'My Orders',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Appcolors.kwhiteColor,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: dummyOrders.length,
//         itemBuilder: (context, index) {
//           final order = dummyOrders[index];
//           return OrderCard(order: order);
//         },
//       ),
//     );
//   }
// }
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/screen_orderdetailspage/screen_orderdetailpage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<OrdersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        //padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              color: const Color(0xFF2A2A3A),
              // decoration: const BoxDecoration(
              //   //borderRadius: BorderRadius.circular(15),

              // ),
              height: 140,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Colors.white,
                          size: 24,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'YOUR ORDERS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 150,
                    height: 2.5,
                    color: Appcolors.ksecondrycolor,
                    margin: const EdgeInsets.only(left: 60),
                  ),
                ],
              ),
            ),
            ResponsiveSizedBox.height10,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Appcolors.kwhiteColor,
              ),
              height: ResponsiveUtils.hp(80),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: dummyOrders.length,
                itemBuilder: (context, index) {
                  final order = dummyOrders[index];
                  return OrderCard(order: order);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Appcolors.kwhiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .5, color: Appcolors.kprimarycolor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              CustomNavigation.pushWithTransition(context,ScreenOerdeDetailPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        order.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                              strokeWidth: 2,
                              color: Colors.deepPurple,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ResponsiveSizedBox.height10,
                        Text(
                          'Rs. ${order.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.deepPurple[700],
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Order Status Indicator
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: order.isDelivered
                          ? Colors.green[50]
                          : Colors.amber[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order.isDelivered ? 'Delivered' : 'Processing',
                      style: TextStyle(
                        color: order.isDelivered
                            ? Colors.green[700]
                            : Colors.amber[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Data Model
class Order {
  final String id;
  final String productName;
  final double price;
  final String imageUrl;
  final bool isDelivered;

  Order({
    required this.id,
    required this.productName,
    required this.price,
    required this.imageUrl,
    this.isDelivered = false,
  });
}

// Dummy Data
final List<Order> dummyOrders = [
  Order(
    id: '1',
    productName: 'Mobile Phone',
    price: 1999.00,
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
    isDelivered: true,
  ),
  Order(
    id: '2',
    productName: 'Mobile Phone',
    price: 3499.99,
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
  ),
  Order(
    id: '3',
    productName: 'Smart Watch',
    price: 12500.00,
    imageUrl: 'https://m.media-amazon.com/images/I/71Swqqe7XAL._AC_UY500_.jpg',
    isDelivered: true,
  ),
  Order(
    id: '4',
    productName: 'Bluetooth Speaker',
    price: 2499.50,
    imageUrl:
        'https://m.media-amazon.com/images/I/61N2a48p9xL._AC_UF894,1000_QL80_.jpg',
  ),
  Order(
    id: '5',
    productName: 'Mobile Phone',
    price: 899.00,
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
    isDelivered: true,
  ),
  Order(
    id: '6',
    productName: 'Mobile phone',
    price: 699.99,
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/4/OV/XU/MN/148217327/oppo-a76-mobile-phone.jpg',
  ),
];
