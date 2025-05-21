import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontName;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final double spacing;
  const CustomText({
    super.key,
    required this.text,
    this.fontName = "TenorSans",
    this.fontSize = 14,
    this.weight = FontWeight.normal,
    this.color = Colors.white,
    this.spacing = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        letterSpacing: spacing,
        fontFamily: fontName,
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
