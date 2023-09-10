import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels/utils/app_color/app_color.dart';
import 'package:hotels/utils/app_icons/app_icons.dart';

import 'widgets/convenience_widget.dart';

class Convenience extends StatelessWidget {
  const Convenience({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.0426,
        right: MediaQuery.of(context).size.width * 0.0426,
      ),
      height: MediaQuery.of(context).size.height * 0.21,
      width: MediaQuery.of(context).size.width * 0.91,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.c_FBFBFC),
      child: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0226,),
            child: Elements(
              image1: AppIcons.people,
              image2: AppIcons.button,
              text1: 'Удобства',
              text2: 'Самое необходимое',
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
              width:double.infinity,
              height: 1,
              color:AppColors.c_000000),
          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0226,),
            child: Elements(
              image1: AppIcons.galichka,
              image2: AppIcons.button,
              text1: 'Что включено',
              text2: 'Самое необходимое',
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
              width:double.infinity,
              height: 1.h,
              color:AppColors.c_000000),
          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0226,),
            child: Elements(
              image1: AppIcons.otkaz,
              image2: AppIcons.button,
              text1: 'Что не включено',
              text2: 'Самое необходимое',
            ),
          ),
        ],
      ),
    );
  }
}
