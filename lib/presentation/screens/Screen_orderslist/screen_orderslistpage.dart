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
import 'package:e_naam/data/redumptionrequests_model.dart';

import 'package:e_naam/presentation/blocs/redumption_requests/redumption_requests_bloc.dart';
import 'package:e_naam/presentation/screens/screen_orderdetailspage/screen_orderdetailpage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<OrdersListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<RedumptionRequestsBloc>()
        .add(RedumptionRequestsFetchingInitialEvent());
  }

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
              child:
                  BlocBuilder<RedumptionRequestsBloc, RedumptionRequestsState>(
                builder: (context, state) {
                  if (state is RedumptionRequestsLoadingState) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Appcolors.ksecondrycolor,
                      ),
                    );
                  }
                  if (state is RedumptionRequestsSuccessState) {
                    return state.redumptionrequests.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.category,
                                  size: 80,
                                  color: Appcolors.ksecondrycolor,
                                ),
                                const SizedBox(height: 16),
                                TextStyles.subheadline(
                                  text: 'No Redumptions yet',
                                  color: Appcolors.kprimarycolor,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: state.redumptionrequests.length,
                            itemBuilder: (context, index) {
                              final order = state.redumptionrequests[index];
                              return OrderCard(order: order);
                            },
                          );
                  } else if (state is RedumptionsRequestsErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
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
  final RedumptionrequestsModel order;

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
              CustomNavigation.pushWithTransition(
                  context,  ScreenOerdeDetailPage(product:order ,));
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
                        order.productPicture,
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
                          ' ${order.redemptionPoints} pts',
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
                      color: order.status == "PENDING"
                          ? Colors.amber[50]
                          : Colors.green[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order.status,
                      style: TextStyle(
                        color: order.status == "PENDING"
                            ? Colors.amber[700]
                            : Colors.green[700],
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

