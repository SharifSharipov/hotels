import 'package:flutter/material.dart';

class PlaySinformation extends StatelessWidget {
  const PlaySinformation(
      {super.key,
      required this.height,
      required this.width,
      required this.bagroudcolor,
      required this.radius, required this.column});
  final double height;
  final double width;
  final Color bagroudcolor;
  final double radius;
  final Column column;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bagroudcolor,
      ),
      child: column,
    );
  }
}
