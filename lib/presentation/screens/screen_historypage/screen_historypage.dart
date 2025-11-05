// import 'package:e_naam/core/colors.dart';
// import 'package:e_naam/core/constants.dart';
// import 'package:e_naam/core/responsive_utils.dart';
// import 'package:e_naam/main.dart';
// import 'package:e_naam/presentation/blocs/transactions_bloc/transactions_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:intl/intl.dart';
// import 'package:solar_icons/solar_icons.dart';

// class ScreenHistoryPage extends StatefulWidget {
//   const ScreenHistoryPage({super.key});

//   @override
//   State<ScreenHistoryPage> createState() => _ScreenHistoryPageState();
// }

// class _ScreenHistoryPageState extends State<ScreenHistoryPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<TransactionsBloc>().add(FetchTransactionsInitialEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.kprimarycolor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Column(
//             children: [
           
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: const Color(0xFF2A2A3A),
//                 ),
//                 height: 120,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'TRANSACTIONS',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Divider(
//                       //color: Colors.pink,
//                       color: Appcolors.ksecondrycolor,
//                       thickness: 3,
//                       endIndent: 130,
//                     ),
//                   ],
//                 ),
//               ),
//               ResponsiveSizedBox.height20,
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Appcolors.kwhiteColor,
//                   ),
//                  // height: ResponsiveUtils.hp(65),
//                   child: BlocBuilder<TransactionsBloc, TransactionsState>(
//                     builder: (context, state) {
//                       if (state is FetchTransactionsLoadingState) {
//                         return Center(
//                           child: SpinKitCircle(
//                             size: 45,
//                             color: Appcolors.ksecondrycolor,
//                           ),
//                         );
//                       }
//                       if (state is FetchTransactionsSuccessState) {
//                         return state.transactions.isEmpty
//                             ? Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       SolarIconsOutline.transferHorizontal,
//                                       size: 60,
//                                       color: Appcolors.ksecondrycolor,
//                                     ),
//                                     const SizedBox(height: 16),
//                                     TextStyles.subheadline(
//                                       text: 'No transactions yet',
//                                       color: Appcolors.kprimarycolor,
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : ListView.builder(
//                                 itemCount: state.transactions.length,
//                                 itemBuilder: (context, index) {
//                                   final transaction = state.transactions[index];
//                                   return Container(
//                                     padding: const EdgeInsets.all(5),
//                                     decoration: const BoxDecoration(
//                                         border: Border(
//                                             bottom: BorderSide(
//                                                 width: .5,
//                                                 color: Appcolors.ksecondrycolor))),
//                                     child: Row(
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             TextStyles.body(
//                                               color: transaction.transactionType ==
//                                                       "EARNED"
//                                                   ? Appcolors.kgreenColor
//                                                   : Appcolors.kredColor,
//                                               text: transaction.transactionType,
//                                             ),
//                                             ResponsiveSizedBox.height5,
//                                             TextStyles.caption(
//                                                 text:
//                                                     formatDateTime(transaction.transactionDateTime!))
//                                           ],
//                                         ),
//                                         const Spacer(),
//                                         TextStyles.body(
//                                           text:
//                                               '${transaction.transactionType == "EARNED" ? '+' : '-'}${transaction.points}',
//                                           color: transaction.transactionType ==
//                                                   "EARNED"
//                                               ? Appcolors.kgreenColor
//                                               : Appcolors.kredColor,
//                                         )
//                                       ],
//                                     ),
//                                   );
//                                 });
//                       } else if (state is FetchtransactionsErrorState) {
//                         return Center(
//                           child: Text(state.message),
//                         );
//                       } else {
//                         return SizedBox.shrink();
//                       }
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   String formatDateTime(String input) {
//   // Parse the API string into DateTime
//   DateTime dateTime = DateTime.parse(input);

//   // Format date and time in 12-hour format
//   String formatted = DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);

//   return formatted;
// }

// }
////////////////////////
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';

import 'package:e_naam/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

class ScreenHistoryPage extends StatefulWidget {
  const ScreenHistoryPage({super.key});

  @override
  State<ScreenHistoryPage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ScreenHistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(FetchTransactionsInitialEvent());
  }

  // --- Pull-to-refresh handler ---
  Future<void> _onRefresh() async {
    context.read<TransactionsBloc>().add(FetchTransactionsInitialEvent());
    await Future.delayed(const Duration(milliseconds: 600));
  }

  // Ensures RefreshIndicator can trigger even with little content
  Widget _buildScrollablePlaceholder(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kprimarycolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF2A2A3A),
                ),
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TRANSACTIONS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Divider(
                      color: Appcolors.ksecondrycolor,
                      thickness: 3,
                      endIndent: 130,
                    ),
                  ],
                ),
              ),
              ResponsiveSizedBox.height20,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Appcolors.kwhiteColor,
                  ),
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: BlocBuilder<TransactionsBloc, TransactionsState>(
                      builder: (context, state) {
                        if (state is FetchTransactionsLoadingState) {
                          return _buildScrollablePlaceholder(
                            SpinKitCircle(
                              size: 45,
                              color: Appcolors.ksecondrycolor,
                            ),
                          );
                        }

                        if (state is FetchTransactionsSuccessState) {
                          if (state.transactions.isEmpty) {
                            return _buildScrollablePlaceholder(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    SolarIconsOutline.transferHorizontal,
                                    size: 60,
                                    color: Appcolors.ksecondrycolor,
                                  ),
                                  const SizedBox(height: 16),
                                  TextStyles.subheadline(
                                    text: 'No transactions yet',
                                    color: Appcolors.kprimarycolor,
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: state.transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = state.transactions[index];
                              return Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: .5,
                                      color: Appcolors.ksecondrycolor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextStyles.body(
                                          color: transaction.transactionType ==
                                                  "EARNED"
                                              ? Appcolors.kgreenColor
                                              : Appcolors.kredColor,
                                          text: transaction.transactionType,
                                        ),
                                        ResponsiveSizedBox.height5,
                                        TextStyles.caption(
                                          text: formatDateTime(
                                            transaction.transactionDateTime!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    TextStyles.body(
                                      text:
                                          '${transaction.transactionType == "EARNED" ? '+' : '-'}${transaction.points}',
                                      color:
                                          transaction.transactionType == "EARNED"
                                              ? Appcolors.kgreenColor
                                              : Appcolors.kredColor,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }

                        if (state is FetchtransactionsErrorState) {
                          return _buildScrollablePlaceholder(
                            Text(
                              state.message,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        return _buildScrollablePlaceholder(
                          const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String formatDateTime(String input) {
    final dateTime = DateTime.parse(input);
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }
}
