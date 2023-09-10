import 'package:flutter/material.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class Price extends StatelessWidget {
  const Price({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 16, top: MediaQuery.of(context).size.height * 0.42,),
      child: RichText(
        text: TextSpan(
          text: 'от ${text1} ₽',
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 30,
              fontFamily: 'SF Pro Display',
              color: AppColors.c_000000),
          children:  <TextSpan>[
            TextSpan(
              text: '\t${text2}',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  color: AppColors.c_828796),
            ),
          ],
        ),
      ),
    );
  }
}
