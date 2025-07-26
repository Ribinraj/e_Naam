// import 'package:e_naam/core/colors.dart';
// import 'package:e_naam/core/constants.dart';
// import 'package:e_naam/core/responsive_utils.dart';
// import 'package:e_naam/main.dart';
// import 'package:e_naam/presentation/blocs/fetch_offerslists_bloc/fetch_offerslists_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScreenOffersPage extends StatefulWidget {
//   const ScreenOffersPage({Key? key}) : super(key: key);

//   @override
//   State<ScreenOffersPage> createState() => _ScreenOffersPageState();
// }

// class _ScreenOffersPageState extends State<ScreenOffersPage> {
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
//     context.read<FetchOfferslistsBloc>().add(FetchOfferslistsInitialEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.kwhiteColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Appcolors.kprimarycolor,
//         title: const Text(
//           'Offers',
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
//           decoration: BoxDecoration(
//             color: Appcolors.kwhiteColor,
//             border: Border.all(
//               color: Appcolors.ksecondrycolor.withOpacity(0.2),
//               width: 1,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Offer Image
//               Container(
//                 height: ResponsiveUtils.hp(20),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Appcolors.kblackColor.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                       child: Image.network(
//                         offer['image'],
//                         height: ResponsiveUtils.hp(20),
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             height: ResponsiveUtils.hp(20),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   Appcolors.ksecondrycolor.withOpacity(0.3),
//                                   Appcolors.kthemegreen.withOpacity(0.3),
//                                 ],
//                               ),
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.local_offer,
//                                 size: 60,
//                                 color: Appcolors.kprimarycolor,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     // Gradient overlay
//                     Container(
//                       height: ResponsiveUtils.hp(20),
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Appcolors.kblackColor.withOpacity(0.1),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Date Information
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 15),
//                       child: Text(
//                         'Special Offer #${index + 1}',
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Appcolors.kprimarycolor,
//                           letterSpacing: 0.5,
//                         ),
//                       ),
//                     ),

//                     // Date row
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _buildDateContainer(
//                             'Valid From',
//                             offer['validFrom'],
//                             Appcolors.kthemegreen,
//                             Icons.calendar_today,
//                           ),
//                         ),
//                         ResponsiveSizedBox.width20,
//                         Expanded(
//                           child: _buildDateContainer(
//                             'Valid To',
//                             offer['validTo'],
//                             Appcolors.korangeColor,
//                             Icons.schedule,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDateContainer(
//       String label, String date, Color color, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: color.withOpacity(0.3),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 icon,
//                 size: 15,
//                 color: color,
//               ),
//               const SizedBox(width: 6),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w500,
//                   color: color,
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 4),
//           Text(
//             _formatDate(date),
//             style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.bold,
//               color: Appcolors.kprimarycolor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatDate(String dateString) {
//     final date = DateTime.parse(dateString);
//     final months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec'
//     ];
//     return '${date.day} ${months[date.month - 1]} ${date.year}';
//   }
// }
/////////////////////////////////////////
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/main.dart';
import 'package:e_naam/presentation/blocs/fetch_offerslists_bloc/fetch_offerslists_bloc.dart';
import 'package:e_naam/data/offers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ScreenOffersPage extends StatefulWidget {
  const ScreenOffersPage({Key? key}) : super(key: key);

  @override
  State<ScreenOffersPage> createState() => _ScreenOffersPageState();
}

class _ScreenOffersPageState extends State<ScreenOffersPage> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOfferslistsBloc>().add(FetchOfferslistsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.kprimarycolor,
        title: const Text(
          'Offers',
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
        child: BlocBuilder<FetchOfferslistsBloc, FetchOfferslistsState>(
          builder: (context, state) {
            if (state is FetchoffersLoadingState) {
                   return Center(
                      child: SpinKitCircle(
                        size: 45,
                        color: Appcolors.ksecondrycolor,
                      ),
                    );
            } else if (state is FetchoffersSuccessState) {
              if (state.offers.isEmpty) {
                return _buildEmptyState();
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.offers.length,
                itemBuilder: (context, index) {
                  return _buildOfferCard(state.offers[index], index);
                },
              );
            } else if (state is FetchOffersErrorState) {
              return _buildErrorState(state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildOfferCard(OfferModel offer, int index) {
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
          decoration: BoxDecoration(
            color: Appcolors.kwhiteColor,
            border: Border.all(
              color: Appcolors.ksecondrycolor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Offer Image
              Container(
                height: ResponsiveUtils.hp(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Appcolors.kblackColor.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        offer.offerPicture,
                        height: ResponsiveUtils.hp(20),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: ResponsiveUtils.hp(20),
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
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Appcolors.kprimarycolor),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: ResponsiveUtils.hp(20),
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
                              child: Icon(
                                Icons.local_offer,
                                size: 60,
                                color: Appcolors.kprimarycolor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Gradient overlay
                    Container(
                      height: ResponsiveUtils.hp(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
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

              // Date Information
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title - Using offer text instead of hardcoded text
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        offer.offer.isNotEmpty ? offer.offer : 'Special Offer #${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.kprimarycolor,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Date row
                    Row(
                      children: [
                        Expanded(
                          child: _buildDateContainer(
                            'Valid From',
                            offer.validFrom,
                            Appcolors.kthemegreen,
                            Icons.calendar_today,
                          ),
                        ),
                        ResponsiveSizedBox.width20,
                        Expanded(
                          child: _buildDateContainer(
                            'Valid To',
                            offer.validTo,
                            Appcolors.korangeColor,
                            Icons.schedule,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateContainer(
      String label, String date, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 15,
                color: color,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: color,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _formatDate(date),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Appcolors.kprimarycolor,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      // Handle different date formats that might come from your API
      DateTime date;
      
      // Try parsing as ISO format first
      if (dateString.contains('T')) {
        date = DateTime.parse(dateString);
      } else {
        // Try parsing as YYYY-MM-DD format
        date = DateFormat('yyyy-MM-dd').parse(dateString);
      }
      
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    } catch (e) {
      // If parsing fails, return the original string
      return dateString;
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_offer_outlined,
            size: 80,
            color: Appcolors.kprimarycolor.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No Offers Available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Appcolors.kprimarycolor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for exciting offers!',
            style: TextStyle(
              fontSize: 16,
              color: Appcolors.kprimarycolor.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<FetchOfferslistsBloc>().add(FetchOfferslistsInitialEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.kprimarycolor,
              foregroundColor: Appcolors.kwhiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Appcolors.korangeColor.withOpacity(0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Appcolors.kprimarycolor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Appcolors.kprimarycolor.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<FetchOfferslistsBloc>().add(FetchOfferslistsInitialEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.kprimarycolor,
              foregroundColor: Appcolors.kwhiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}