


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color/app_color.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
  }) : super(key: key);

  final List image;
  final double height;
  final double width;

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.3,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.image.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: widget.height,
                          width: widget.width,
                          child: Image.network(i,
                              height: widget.height, width: widget.width),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.27,
              ),
              child: Align(
                child: Container(
                  width: 75,
                  height: 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.c_FFFFFF,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.27,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.image.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? AppColors.c_000000
                          : AppColors.c_000000.withOpacity(
                              0.17), // Customize the active and inactive dot colors
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
