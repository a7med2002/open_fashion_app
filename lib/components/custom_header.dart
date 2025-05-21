import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomText(
              text: title, spacing: 4, fontSize: 24, color: AppColor.primary),
          SvgPicture.asset(
            "assets/svgs/shape.svg",
            color: AppColor.primary,
            width: 160,
          ),
        ],
      ),
    );
  }
}
