import 'package:flutter/material.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class CoordinateOfTheText extends StatelessWidget {
  const CoordinateOfTheText(
      {super.key,
      required this.textSize1,
      required this.textSize2,
      required this.text1,
      required this.text2});
  final double textSize1;
  final double textSize2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 315),
      child: RichText(
        text: TextSpan(
          text: 'от ${text1} ₽',
          style:  TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: textSize1,
              fontFamily: 'SF Pro Display',
              color: AppColors.c_000000),
          children:  <TextSpan>[
            TextSpan(
              text: text2,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: textSize2,
                  fontFamily: 'SF Pro Display',
                  color: AppColors.c_828796),
            ),
          ],
        ),
      ),
    );
  }
}
