import 'dart:developer';

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/productmodel.dart';
import 'package:e_naam/presentation/blocs/fetch_profile/fetch_profile_bloc.dart';
import 'package:e_naam/presentation/screens/Redeem_confirmation/redeem_confirmationpage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailpage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailpage({super.key, required this.product});

  @override
  State<ProductDetailpage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ProductDetailpage> {
  //final TextEditingController pointController = TextEditingController();
  String? userpoints;
  @override
  void initState() {
    super.initState();
    final state = context.read<FetchProfileBloc>().state;
    if (state is FetchProfileSuccessState) {
      userpoints = state.profile.userPoints;
      log(userpoints ?? "'uuuuuuuu");
    }
  }

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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Appcolors.kprimarycolor,
                        height: ResponsiveUtils.hp(30),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Appcolors.kwhiteColor,
                                    size: 25,
                                  ),
                                ),
                                ResponsiveSizedBox.width50,
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Product Details',
                                  style: TextStyle(
                                    color: Appcolors.kwhiteColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Positioned(
                        top: ResponsiveUtils.hp(15),
                        left: ResponsiveUtils.screenWidth / 12,
                        child: Container(
                          width: ResponsiveUtils.wp(80),
                          height: ResponsiveUtils.hp(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Appcolors.kwhiteColor,
                            border: Border.all(
                              width: 1,
                              color: Appcolors.kprimarycolor,
                            ),
                          ),
                          child: Hero(
                            tag: widget.product.productId,
                            child: ImageWithFallback(
                              imageUrl: widget.product.productPicture,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ResponsiveUtils.hp(15)),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.body(
                          text: widget.product.productName,
                          weight: FontWeight.bold,
                          color: Appcolors.kgreyColor,
                        ),
                        ResponsiveSizedBox.height5,
                        TextStyles.headline(
                          text: '${widget.product.redeemPoints} pts',
                          weight: FontWeight.bold,
                        ),
                        ResponsiveSizedBox.height5,
                        TextStyles.body(
                          text: 'Description',
                          weight: FontWeight.bold,
                          color: Appcolors.kgreyColor,
                        ),
                        ResponsiveSizedBox.height5,
                        Text(
                          widget.product.description,
                          style: TextStyle(
                            color: Appcolors.kblackColor,
                            fontSize: ResponsiveUtils.wp(3),
                          ),
                        ),
                        // Add bottom spacing to avoid content being hidden by the fixed button
                        //SizedBox(height: ResponsiveUtils.hp(5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Fixed bottom button
          Padding(
              padding: const EdgeInsets.only(
                  bottom: 40, top: 20, left: 15, right: 15),
              child: userpoints != null
                  ? int.parse(userpoints!) >=
                          int.parse(widget.product.redeemPoints)
                      ? CustomSqureButton(
                          ontap: () {
                            CustomNavigation.pushWithTransition(
                                context,
                                OrderConfirmationPage(
                                  product: widget.product,
                                ));
                          },
                          text: 'Redeem',
                          color: Appcolors.kgreenColor,
                        )
                      : CustomSqureButton(
                          text: "You don't have enough points to redeem",
                          color: const Color.fromARGB(255, 155, 158, 165))
                  : SizedBox.shrink()),
        ],
      ),
    );
  }
}
