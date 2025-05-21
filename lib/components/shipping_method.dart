import 'package:flutter/material.dart';
import 'package:open_fashion/components/custom_container.dart';
import 'package:open_fashion/components/custom_text.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Shipping Method".toUpperCase(),
          fontSize: 16,
          color: Colors.black38,
        ),
        SizedBox(height: 10),
        CustomContainer(
            text: "Pickup at store", icon: Icon(Icons.add), iconWithText: true),
      ],
    );
  }
}
