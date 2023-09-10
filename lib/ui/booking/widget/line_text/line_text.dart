import 'package:flutter/material.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class LineText extends StatelessWidget {
  const LineText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.widts, required this.color, required this.fontWeight});
  final String text1;
  final double widts;
  final String text2;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              color: AppColors.c_828796),
        ),
        SizedBox(
          width: widts,
        ),
        Text(
           text2,
          style:  TextStyle(
              fontWeight: fontWeight,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              color: color),
        ),
      ],
    );
  }
}
