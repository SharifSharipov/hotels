import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  GlobalButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.color,
      required this.radius,
      required this.textColor,
      required this.textsize,
      required this.fontStyle, required this.onPressed});
  final String text;
  final double height;
  final double width;
  final Color color;
  final double radius;
  final Color textColor;
  final double textsize;
  final FontStyle fontStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: TextButton(
            onPressed:onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: textColor,
                  fontSize: textsize,
                  fontStyle: fontStyle),
            )));
  }
}
