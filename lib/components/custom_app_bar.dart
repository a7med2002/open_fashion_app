import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBlackk;
  const CustomAppBar({super.key, required this.isBlackk});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackk;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: isBlack ? AppColor.primary : Colors.white,
        leadingWidth: 24,
        centerTitle: true,
        leading: SvgPicture.asset("assets/svgs/Menu.svg",
            color: isBlack ? Colors.white : AppColor.primary),
        title: SvgPicture.asset("assets/logo/Logo.svg",
            color: isBlack ? Colors.white : AppColor.primary),
        actions: [
          SvgPicture.asset("assets/svgs/Search.svg",
              color: isBlack ? Colors.white : AppColor.primary),
          SizedBox(width: 20),
          SvgPicture.asset("assets/svgs/shopping bag.svg",
              color: isBlack ? Colors.white : AppColor.primary),
        ],
      ),
    );
  }
}
