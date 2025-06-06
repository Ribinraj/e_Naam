

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/redumptionrequests_model.dart';


import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:e_naam/widgets/custom_squrebutton.dart';
import 'package:flutter/material.dart';


class ScreenOerdeDetailPage extends StatefulWidget {
  final RedumptionrequestsModel product;
  const ScreenOerdeDetailPage({super.key, required this.product});

  @override
  State<ScreenOerdeDetailPage> createState() => _ScreenOerdeDetailPageState();
}

class _ScreenOerdeDetailPageState extends State<ScreenOerdeDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          color: Appcolors.kprimarycolor,
          height: ResponsiveUtils.hp(25),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                      )),
                  ResponsiveSizedBox.width50,
                  const Text(
                    textAlign: TextAlign.center,
                    'ORDER DETAILS',
                    style: TextStyle(
                        color: Appcolors.kwhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
        Positioned(
            top: ResponsiveUtils.hp(15),
            left: ResponsiveUtils.screenWidth / 7,
            child: Container(
                width: ResponsiveUtils.wp(70),
                height: ResponsiveUtils.hp(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Appcolors.kwhiteColor,
                    border:
                        Border.all(width: 1, color: Appcolors.kprimarycolor)),
                child: ImageWithFallback(
                  imageUrl: widget.product.productPicture,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                )))
      ]),
      SizedBox(
        height: ResponsiveUtils.hp(10),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.productName,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Appcolors.kblackColor,
                  fontSize: ResponsiveUtils.wp(4)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            ResponsiveSizedBox.height10,
            TextStyles.body(
                text: '${widget.product.redemptionPoints} pts',
                weight: FontWeight.bold,
                color: Appcolors.kprimarycolor),
            ResponsiveSizedBox.height20,

            // Status Indicator Section
            TextStyles.caption(
              text: 'Order Status',
            ),
            Divider(
              thickness: .5,
              color: Appcolors.kgreyColor,
            ),
            ResponsiveSizedBox.height10,
            _buildStatusIndicator(widget.product.status),
            ResponsiveSizedBox.height20,

            TextStyles.caption(
              text: 'Shipping details',
            ),
            Divider(
              thickness: .5,
              color: Appcolors.kgreyColor,
            ),
            ResponsiveSizedBox.height10,
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 248, 239, 226)),
                child: Column(
                  children: [
                    _buildAddressRow('Name', widget.product.recipientName),
                    _buildAddressRow('Adress', widget.product.deliveryAddress),
                    _buildAddressRow('City', widget.product.deliveryCity),
                    _buildAddressRow('State', widget.product.deliveryState),
                    _buildAddressRow('Country', widget.product.deliveryCountry),
                    _buildAddressRow('Pincode', widget.product.deliveryPinCode),
                  ],
                )),

            ResponsiveSizedBox.height20,
            CustomSqureButton(
                ontap: () {
                  Navigator.pop(context);
                },
                color: Appcolors.kgreenColor,
                text: 'Back')
          ],
        ),
      ),
    ])));
  }

  Widget _buildStatusIndicator(String status) {
    Color statusColor;
    IconData statusIcon;

    switch (status.toLowerCase()) {
      case 'pending':
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
      case 'delivered':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'cancelled':
      case 'cancel':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusIcon,
            color: statusColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          TextStyles.body(
            text: status.toUpperCase(),
            weight: FontWeight.w600,
            color: statusColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveUtils.hp(0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ResponsiveUtils.wp(25),
            child: TextStyles.body(
              text: label,
              color: Appcolors.kblackColor.withOpacity(0.7),
            ),
          ),
          SizedBox(width: ResponsiveUtils.wp(3)),
          Expanded(
            child: TextStyles.body(
              text: value,
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
