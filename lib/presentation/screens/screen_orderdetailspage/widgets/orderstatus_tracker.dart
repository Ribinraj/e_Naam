

import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:flutter/material.dart';


class OrderStatusTracker extends StatelessWidget {
  // Status can be "confirmed", "shipped", or "delivered"
  final String currentStatus;

  const OrderStatusTracker({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusItem(
          title: "Order Confirmed, Nove 07,2025",
          isCompleted: currentStatus == "confirmed" ||
              currentStatus == "shipped" ||
              currentStatus == "delivered",
          showLine: true,
        ),
        // _buildStatusItem(
        //   title: "Shipped",
        //   isCompleted:
        //       currentStatus == "shipped" || currentStatus == "delivered",
        //   showLine: true,
        // ),
        _buildStatusItem(
          title: "Delivered, Dec 07,2025",
          isCompleted: currentStatus == "delivered",
          showLine: false,
        ),
      ],
    );
  }

  Widget _buildStatusItem(
      {required String title,
      required bool isCompleted,
      required bool showLine}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.white, size: 9)
                  : null,
            ),
            if (showLine)
              Container(
                width: 1.5,
                height: 30,
                color: isCompleted ? Colors.green : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: TextStyles.caption(text: title, color: Appcolors.kblackColor),
        ),
      ],
    );
  }
}
