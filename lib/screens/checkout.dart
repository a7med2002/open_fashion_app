import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/cart_widget.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_header.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/place_order.dart';

class Checkout extends StatefulWidget {
  final ProductModel product;
  const Checkout({super.key, required this.product});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQun = 1;

  @override
  Widget build(BuildContext context) {
    int total = selectedQun * int.parse(widget.product.price);
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomHeader(title: "Checkout".toUpperCase()),
                SizedBox(height: 20),
                CartWidget(
                  product: widget.product,
                  onChanged: (v) {
                    setState(() {
                      selectedQun = v;
                    });
                  },
                  qunt: selectedQun,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/promoCode.svg",
                        color: AppColor.primary,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(width: 15),
                      CustomText(
                        text: "Add promo code",
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SvgPicture.asset(
                          "assets/svgs/Door to Door Delivery.svg",
                          color: AppColor.primary,
                          width: 26,
                          height: 26,
                        ),
                        SizedBox(width: 15),
                        CustomText(
                          text: "Delivery",
                          color: AppColor.primary,
                        )
                      ]),
                      CustomText(
                        text: "Free",
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 270),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Est. Total",
                      color: AppColor.primary,
                      fontSize: 18,
                    ),
                    CustomText(
                      text:
                          "\$${selectedQun * int.parse(widget.product.price)}",
                      color: Colors.red.shade200,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            name: "chekout",
            withIcon: true,
            svg: "assets/svgs/shopping bag.svg",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceOrder(
                        product: widget.product,
                        total: total,
                        qunt: selectedQun,
                      )));
            },
          )
        ],
      ),
    );
  }
}
