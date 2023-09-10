import 'package:flutter/material.dart';
import 'package:hotels/utils/app_color/app_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;

  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 3.0 || strokeWidth == null) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.c_000000),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.c_FFFFFF),
      );
    }
  }
}
