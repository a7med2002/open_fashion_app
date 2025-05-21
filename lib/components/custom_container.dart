import 'package:flutter/material.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool iconWithText;
  const CustomContainer(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconWithText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            color: AppColor.primary,
            fontSize: 16,
          ),
          Row(
            children: [
              iconWithText
                  ? CustomText(
                      text: "Free",
                      color: AppColor.primary,
                      fontSize: 16,
                    )
                  : SizedBox.shrink(),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: icon)
            ],
          )
        ],
      ),
    );
  }
}
