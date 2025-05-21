import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/cart_widget.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_container.dart';
import 'package:open_fashion/components/custom_dialog.dart';
import 'package:open_fashion/components/custom_header.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/components/shipping_method.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/add_new_address.dart';
import 'package:open_fashion/screens/add_new_card.dart';

class PlaceOrder extends StatefulWidget {
  final ProductModel product;
  final int total;
  final int qunt;
  const PlaceOrder(
      {super.key,
      required this.product,
      required this.total,
      required this.qunt});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic savedAddress;
  dynamic editAddress;
  dynamic savedCard;
  late int selectedQunt;

  @override
  void initState() {
    selectedQunt = widget.qunt;
    super.initState();
  }

// address
  void _openAddress(context) async {
    final dataAddress = await Navigator.push(
        context, MaterialPageRoute(builder: (c) => AddNewAddress()));

    if (dataAddress != null) {
      setState(() {
        savedAddress = dataAddress;
      });
    }
  }

  void _editAddress(context) async {
    final newAddress = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (c) => AddNewAddress(lastAddress: savedAddress)));

    setState(() {
      savedAddress = newAddress;
    });
  }

// card
  void _openCard(context) async {
    final dataCard = await Navigator.push(
        context, MaterialPageRoute(builder: (c) => AddNewCard()));

    if (dataCard != null) {
      setState(() {
        savedCard = dataCard;
      });
    }
  }

  void _editCard(context) async {
    final newCard = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddNewCard(lastCard: savedCard)));
    setState(() {
      savedCard = newCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(child: CustomHeader(title: "checkout".toUpperCase())),
                SizedBox(height: 20),
                savedAddress != null && savedCard != null
                    ? SizedBox.shrink()
                    : CustomText(
                        text: "Shipping address".toUpperCase(),
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                SizedBox(height: 10),
                savedAddress != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    "${savedAddress['first']} ${savedAddress['last']}",
                                fontSize: 16,
                                color: AppColor.primary,
                              ),
                              CustomText(
                                text:
                                    "${savedAddress['address']}".toUpperCase(),
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                              CustomText(
                                text: "Roseville NH 11523",
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                              CustomText(
                                text: "${savedAddress['phoneNumber']}",
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          SizedBox(width: 120),
                          IconButton(
                              onPressed: () {
                                _editAddress(context);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black38,
                              ))
                        ],
                      )
                    : SizedBox.shrink(),
                // Add shipping address
                SizedBox(height: 20),
                savedAddress != null
                    ? SizedBox.shrink()
                    : InkWell(
                        onTap: () {
                          setState(() {
                            _openAddress(context);
                          });
                        },
                        child: CustomContainer(
                            text: "Add shipping address",
                            icon: Icon(Icons.add),
                            iconWithText: false),
                      ),
                SizedBox(height: 20),
                // Shipping Method
                savedAddress != null && savedCard != null
                    ? SizedBox.shrink()
                    : ShippingMethod(),
                savedAddress != null && savedCard != null
                    ? Divider(
                        color: Colors.black12,
                      )
                    : SizedBox(height: 20),
                // Payment method
                savedAddress != null && savedCard != null
                    ? SizedBox.shrink()
                    : CustomText(
                        text: "Payment method".toUpperCase(),
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                SizedBox(height: 10),

                savedCard != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/svgs/MasterCard.svg"),
                          CustomText(
                            text:
                                "Master Card ending ••••${savedCard['cardNumber'].substring(savedCard['cardNumber'].length - 2)}",
                            color: AppColor.primary,
                          ),
                          IconButton(
                              onPressed: () {
                                _editCard(context);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black38,
                              ))
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          _openCard(context);
                        },
                        child: CustomContainer(
                            text: "select payment method",
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            iconWithText: false),
                      ),
                savedAddress != null && savedCard != null
                    ? Divider(
                        color: Colors.black12,
                      )
                    : SizedBox(height: 20),
                SizedBox(height: 20),
                savedAddress != null && savedCard != null
                    ? CartWidget(
                        product: widget.product,
                        onChanged: (qnt) {
                          setState(() {
                            selectedQunt = qnt;
                          });
                        },
                        qunt: widget.qunt,
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 180),
                // Total Price
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Total",
                        color: AppColor.primary,
                        fontSize: 18,
                      ),
                      CustomText(
                        text:
                            "\$${selectedQunt * int.parse(widget.product.price)}",
                        color: Colors.red.shade200,
                        fontSize: 18,
                      ),
                    ])
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            name: "Place order".toUpperCase(),
            withIcon: true,
            svg: "assets/svgs/shopping bag.svg",
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: CustomDialog(),
                    );
                  });

              // ----------------------------------------------------
            },
          )
        ],
      ),
    );
  }
}
