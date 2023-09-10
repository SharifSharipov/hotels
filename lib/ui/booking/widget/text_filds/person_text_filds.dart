import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels/utils/app_color/app_color.dart';

class GlobalTextFilds extends StatelessWidget {
  const GlobalTextFilds(
      {super.key,
      required this.controllerl,
      required this.labeltext,
      required this.textInputFormatter});
  final TextEditingController controllerl;
  final String labeltext;
  final List<TextInputFormatter> textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 54.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.c_F6F6F9,
            ),
          ),
          TextFormField(
            inputFormatters: textInputFormatter,
            controller: controllerl,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border:InputBorder.none,
              labelText: labeltext,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.c_a9abb7,
                  fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
