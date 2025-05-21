import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/screens/home.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)),
          ),
          CustomText(
            text: "Payment success".toUpperCase(),
            fontSize: 20,
            color: AppColor.primary,
          ),
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset("assets/svgs/successShape.svg"),
          SizedBox(
            height: 20,
          ),
          CustomText(
            text: "Your payment was success",
            fontSize: 16,
            color: AppColor.primary,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: "Payment ID: 56456541",
            fontSize: 14,
            color: AppColor.primary,
          ),
          SizedBox(
            height: 15,
          ),
          SvgPicture.asset(
            "assets/svgs/shape.svg",
            color: Colors.black,
            width: 100,
          ),
          SizedBox(
            height: 15,
          ),
          CustomText(
            text: "Rate your purchase",
            fontSize: 18,
            color: AppColor.primary,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svgs/Rate/Disappointed.svg"),
              SizedBox(width: 20),
              SvgPicture.asset("assets/svgs/Rate/Happy.svg"),
              SizedBox(width: 20),
              SvgPicture.asset("assets/svgs/Rate/In Love.svg")
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: AppColor.primary,
                    height: 50,
                    child:
                        Center(child: CustomText(text: "Submit".toUpperCase())),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black45)),
                      height: 50,
                      child: Center(
                          child: CustomText(
                              color: AppColor.primary,
                              text: "back to home".toUpperCase())),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
