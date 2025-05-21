import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final bool withIcon;
  final String svg;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.name,
      required this.withIcon,
      this.svg = "",
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColor.primary,
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            withIcon
                ? SvgPicture.asset(
                    svg,
                    width: 24,
                    height: 24,
                  )
                : SizedBox.shrink(),
            SizedBox(width: 10),
            CustomText(
              text: name.toUpperCase(),
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
