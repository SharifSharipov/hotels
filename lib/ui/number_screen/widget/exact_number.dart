import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExactNumber extends StatelessWidget {
  const ExactNumber(
      {super.key,
      required this.fontColor,
      required this.text,
      required this.fontWeight,
      required this.width,
      required this.height,
      required this.textColor,
      required this.textSize,
      required this.radius,
      required this.picture});
  final Color fontColor;
  final String text;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final Color textColor;
  final double textSize;
  final double radius;
  final String picture;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: fontColor,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: fontWeight,
              color: textColor,
              fontStyle: FontStyle.normal,
              fontFamily: 'SF Pro Display',
            ),
          ),
          SvgPicture.asset(picture),
        ],
      ),
    );
  }
}
