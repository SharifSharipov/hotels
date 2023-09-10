import 'package:flutter/material.dart';
class Bookingtext extends StatelessWidget {
  const Bookingtext(
      {super.key,
        required this.left,
        required this.top,
        required this.fontsize,
        required this.text,
        required this.fontWeight, required this.color});
  final double left;
  final double top;
  final double fontsize;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontsize,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
            color: color),
      ),
    );
  }

}
