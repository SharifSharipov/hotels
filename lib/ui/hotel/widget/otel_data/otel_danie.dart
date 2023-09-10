import 'package:flutter/material.dart';
import 'package:hotels/utils/app_color/app_color.dart';
class Danie extends StatefulWidget {
  const Danie(
      {super.key,
      required this.height,

      required this.text, required this.top, required this.left});

  final double height;
  final double top;
  final double left;
  final String text;

  @override
  State<Danie> createState() => _DanieState();
}

class _DanieState extends State<Danie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.c_F6F6F9,
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: widget.top ,left: widget.left ),
        child: Text(
            widget.text,
            style: const TextStyle(
                fontFamily: "SF Pro Display",
                color: AppColors.c_828796,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
      ),

    );
  }
}
