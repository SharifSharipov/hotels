import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingName extends StatelessWidget {
  const RatingName(
      {super.key,
      required this.width,
      required this.height,
      required this.fontWeight,
      required this.text,
      required this.textColor,
      required this.fontColor,
      required this.fontStyle,
      required this.textSize,
      required this.radius,
      required this.picture});

  final double width;
  final double height;
  final FontWeight fontWeight;
  final String text;
  final Color textColor;
  final Color fontColor;
  final FontStyle fontStyle;
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
      child: Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: Row(
          children: [
            SvgPicture.asset(picture),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontStyle: fontStyle,
                  fontSize: textSize,
                  fontWeight: fontWeight,
                  color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
