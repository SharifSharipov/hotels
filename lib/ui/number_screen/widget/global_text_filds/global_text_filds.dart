import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.obscureText = false,
    this.maxLine = 1,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w,vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10.r,
              offset: const Offset(5, 5),
            )
          ]
      ),
      child: TextField(
        cursorColor: const Color(0xFF4F8962),
        maxLines: maxLine,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color:  AppColors.c_14142B,
            fontFamily: "SF Pro Display"),
        textAlign: textAlign,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.c_14142B,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.c_a9abb7,
              fontFamily: "SF Pro Display"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.c_f6f6f9,),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color:AppColors.c_f6f6f9,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.c_f6f6f9,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.c_f6f6f9,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.c_f6f6f9,
            ),
          ),
        ),
      ),
    );
  }
}
