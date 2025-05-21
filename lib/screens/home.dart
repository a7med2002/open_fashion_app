import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/models/cover_model.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/checkout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: CustomAppBar(isBlackk: true),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
              top: 60,
              right: 0,
              left: 0,
              child: SvgPicture.asset("assets/texts/October.svg")),
          Positioned(
              top: 100,
              right: 0,
              left: 0,
              child: SvgPicture.asset("assets/texts/Collection.svg")),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 130),
                Image.asset("assets/cover/image20.png"),
                SizedBox(height: 40),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.53,
                      crossAxisSpacing: 15),
                  itemCount: ProductModel.products.length,
                  itemBuilder: (context, index) {
                    final item = ProductModel.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Checkout(product: item)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          SizedBox(height: 15),
                          CustomText(text: item.name),
                          CustomText(text: item.desription),
                          CustomText(
                            text: "\$${item.price}",
                            color: Colors.red.shade200,
                            fontSize: 18,
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                CustomText(
                    text: "You may also like".toUpperCase(), fontSize: 30),
                SizedBox(height: 8),
                SvgPicture.asset(
                  "assets/svgs/shape.svg",
                  width: 150,
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CoverModel.covers.length,
                    itemBuilder: (context, index) {
                      final item = CoverModel.covers[index];
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              height: 350,
                              width: 300,
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: item.name.toUpperCase(),
                              fontSize: 20,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40),
                about(),
                Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.grey.shade600,
                  child: Center(
                    child: CustomText(
                      text: "Copyright© OpenUI All Rights Reserved.",
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

Widget about() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.facebook,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 30),
          Icon(
            Icons.facebook,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 30),
          Icon(
            Icons.facebook,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      SizedBox(height: 30),
      SvgPicture.asset(
        "assets/svgs/shape.svg",
        width: 150,
      ),
      SizedBox(height: 30),
      CustomText(
          fontSize: 18,
          text:
              "support@openui.design \n      +60 825 876 \n 08:00 - 22:00 - Everyday"),
      SizedBox(height: 30),
      SvgPicture.asset(
        "assets/svgs/shape.svg",
        width: 150,
      ),
      SizedBox(height: 40),
      CustomText(text: "About        Contact        Blog", fontSize: 18),
      SizedBox(height: 30)
    ],
  );
}
