import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/models/product_model.dart';

class CartWidget extends StatefulWidget {
  final ProductModel product;
  final Function(int) onChanged;
  final int qunt;
  const CartWidget(
      {super.key,
      required this.product,
      required this.onChanged,
      required this.qunt});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int number = 1;

  @override
  void initState() {
    number = 1;
    number = widget.qunt;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          widget.product.image,
          width: 120,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.product.name,
              color: AppColor.primary,
              spacing: 2,
              fontSize: 20,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomText(
                text: widget.product.desription,
                color: AppColor.primary,
                fontSize: 16),
            SizedBox(height: 20),
            Row(
              children: [
                qunt("assets/svgs/min.svg", () {
                  setState(() {
                    if (number > 1) {
                      number--;
                      widget.onChanged(number);
                    }
                  });
                }),
                SizedBox(width: 20),
                CustomText(
                  text: number.toString(),
                  weight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColor.primary,
                ),
                SizedBox(width: 20),
                qunt("assets/svgs/Plus.svg", () {
                  setState(() {
                    number++;
                    widget.onChanged(number);
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            CustomText(
              text: "\$${widget.product.price}",
              color: Colors.red.shade200,
              weight: FontWeight.bold,
              fontSize: 20,
            ),
          ],
        )
      ],
    );
  }
}

Widget qunt(svg, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 26,
      height: 26,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: SvgPicture.asset(
        svg,
        color: AppColor.primary,
      ),
    ),
  );
}
