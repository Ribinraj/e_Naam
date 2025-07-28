// import 'package:e_naam/core/colors.dart';
// import 'package:e_naam/core/constants.dart';
// import 'package:e_naam/core/responsive_utils.dart';
// import 'package:e_naam/main.dart';
// import 'package:e_naam/presentation/blocs/fetch_happyclients_bloc/fetch_happyclients_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScreenHappycustomersPage extends StatefulWidget {
//   const ScreenHappycustomersPage({super.key});

//   @override
//   State<ScreenHappycustomersPage> createState() => _ScreenOffersPageState();
// }

// class _ScreenOffersPageState extends State<ScreenHappycustomersPage> {
//   // Hardcoded sample data
//   final List<Map<String, dynamic>> offers = [
//     {
//       'image':
//           'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=800&h=400&fit=crop',
//       'validFrom': '2024-07-01',
//       'validTo': '2024-08-15',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800&h=400&fit=crop',
//       'validFrom': '2024-07-10',
//       'validTo': '2024-08-30',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&h=400&fit=crop',
//       'validFrom': '2024-07-15',
//       'validTo': '2024-09-10',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=800&h=400&fit=crop',
//       'validFrom': '2024-07-20',
//       'validTo': '2024-09-25',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800&h=400&fit=crop',
//       'validFrom': '2024-07-25',
//       'validTo': '2024-10-05',
//     },
//   ];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<FetchHappyclientsBloc>().add(FetchHappyclientsInitialEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.kwhiteColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Appcolors.kprimarycolor,
//         title: const Text(
//           'Happy Customers',
//           style: TextStyle(
//             color: Appcolors.kwhiteColor,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Appcolors.kwhiteColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Appcolors.kprimarycolor,
//                 Color.fromARGB(255, 45, 38, 70),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(10, 32, 27, 56),
//               Appcolors.kwhiteColor,
//             ],
//           ),
//         ),
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16.0),
//           itemCount: offers.length,
//           itemBuilder: (context, index) {
//             return _buildOfferCard(offers[index], index);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildOfferCard(Map<String, dynamic> offer, int index) {
//     return Container(
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//         top: index == 0 ? 10.0 : 0,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Appcolors.kprimarycolor.withOpacity(0.1),
//             blurRadius: 15,
//             offset: const Offset(0, 8),
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           height: ResponsiveUtils.hp(25), // Optional: Adjust height as needed
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Appcolors.kwhiteColor,
//             border: Border.all(
//               color: Appcolors.ksecondrycolor.withOpacity(0.2),
//               width: 1,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Image.network(
//                 offer['image'],
//                 height: double.infinity,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     height: double.infinity,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Appcolors.ksecondrycolor.withOpacity(0.3),
//                           Appcolors.kthemegreen.withOpacity(0.3),
//                         ],
//                       ),
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         Icons.local_offer,
//                         size: 60,
//                         color: Appcolors.kprimarycolor,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               // Optional: Add image overlay if needed
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Appcolors.kblackColor.withOpacity(0.1),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/////////////////////////////////
import 'package:e_naam/core/colors.dart';

import 'package:e_naam/core/responsive_utils.dart';

import 'package:e_naam/presentation/blocs/fetch_happyclients_bloc/fetch_happyclients_bloc.dart';
import 'package:e_naam/data/fetch_happyclient.dart'; // Import your model
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenHappycustomersPage extends StatefulWidget {
  const ScreenHappycustomersPage({super.key});

  @override
  State<ScreenHappycustomersPage> createState() => _ScreenHappycustomersPageState();
}

class _ScreenHappycustomersPageState extends State<ScreenHappycustomersPage> {
  @override
  void initState() {
    super.initState();
    context.read<FetchHappyclientsBloc>().add(FetchHappyclientsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.kprimarycolor,
        title: const Text(
          'Happy Customers',
          style: TextStyle(
            color: Appcolors.kwhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Appcolors.kwhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Appcolors.kprimarycolor,
                Color.fromARGB(255, 45, 38, 70),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(10, 32, 27, 56),
              Appcolors.kwhiteColor,
            ],
          ),
        ),
        child: BlocBuilder<FetchHappyclientsBloc, FetchHappyclientsState>(
          builder: (context, state) {
            if (state is FetchHappyClientsLoadingState) {
                return Center(
                      child: SpinKitCircle(
                        size: 45,
                        color: Appcolors.ksecondrycolor,
                      ),
                    );
            } else if (state is FetchHappyclientsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FetchHappyclientsBloc>().add(FetchHappyclientsInitialEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.kprimarycolor,
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: Appcolors.kwhiteColor),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is FetchHappyclientsSuccessState) {
              final happyClients = state.happiclients;
              
              if (happyClients.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sentiment_satisfied_alt,
                        size: 64,
                        color: Appcolors.kprimarycolor,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No happy customers found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Appcolors.kprimarycolor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<FetchHappyclientsBloc>().add(FetchHappyclientsInitialEvent());
                },
                color: Appcolors.kprimarycolor,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: happyClients.length,
                  itemBuilder: (context, index) {
                    return _buildHappyClientCard(happyClients[index], index);
                  },
                ),
              );
            }

            // Initial state
            return const Center(
              child: CircularProgressIndicator(
                color: Appcolors.kprimarycolor,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHappyClientCard(HappyClientModel happyClient, int index) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
        top: index == 0 ? 10.0 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Appcolors.kprimarycolor.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: ResponsiveUtils.hp(25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Appcolors.kwhiteColor,
            border: Border.all(
              color: Appcolors.ksecondrycolor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              // Display the image from API
              Image.network(
                happyClient.picture,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Appcolors.ksecondrycolor.withOpacity(0.1),
                          Appcolors.kthemegreen.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: Appcolors.kprimarycolor,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Appcolors.ksecondrycolor.withOpacity(0.3),
                          Appcolors.kthemegreen.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt,
                            size: 60,
                            color: Appcolors.kprimarycolor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Happy Customer',
                            style: TextStyle(
                              color: Appcolors.kprimarycolor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Optional overlay for better visual appeal
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Appcolors.kblackColor.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
         
            
            ],
          ),
        ),
      ),
    );
  }
}