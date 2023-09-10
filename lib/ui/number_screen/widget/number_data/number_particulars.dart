import 'package:flutter/material.dart';

class NumberParticulars extends StatelessWidget {
  const NumberParticulars(
      {super.key,
      required this.height,
      required this.text,
      required this.fontWeight,
      required this.fontStyle,
      required this.textcolor,
      required this.radius,
      required this.fontsize, required this.conteynerFontColor});
  final double height;
  final String text;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double fontsize;
  final Color textcolor;
  final double radius;
  final Color conteynerFontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: conteynerFontColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontsize,
              fontStyle: fontStyle,
              fontFamily: 'SF Pro Display',
              color: textcolor),
        ),
      ),
    );
  }
}
