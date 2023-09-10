import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class Elements extends StatelessWidget {
  const Elements(
      {super.key,
      required this.image1,
      required this.image2,
      required this.text1,
      required this.text2});
  final String image1;
  final String image2;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(image1,height: 24,width: 24,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.0446,),
            RichText(
              text: TextSpan(
                text: text1,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    color: AppColors.c_000000),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n${text2}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        color: AppColors.c_828796),
                  ),
                ],
              ),
            ),
          ],
        ),
        SvgPicture.asset(image2,height: 24,width: 24,),
      ],
    );
  }
}
