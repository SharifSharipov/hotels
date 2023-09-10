import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels/ui/hotel/widget/bottom/bottom.dart';
import 'package:hotels/utils/app_color/app_color.dart';
import 'package:hotels/utils/app_icons/app_icons.dart';
import 'package:hotels/utils/routs/approuts.dart';
class OrderHasBeenPaidScreen extends StatefulWidget {
  const OrderHasBeenPaidScreen({super.key});

  @override
  State<OrderHasBeenPaidScreen> createState() => _OrderHasBeenPaidScreenState();
}

class _OrderHasBeenPaidScreenState extends State<OrderHasBeenPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.bookingScreen);
          },
          icon: SvgPicture.asset(AppIcons.leviyNazad),
        ),
        backgroundColor: AppColors.c_FFFFFF,
        elevation: 0,
        title: const Text(
          "Заказ оплачен",
          style: TextStyle(
              fontFamily: "SF Pro Display",
              color: AppColors.c_000000,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColors.c_FFFFFF,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppIcons.reaksiya,height: 94.h,width: 94.w,),
            SizedBox(height: 32.h,),
            const Text(
              "Ваш заказ принят в работу",
              style: TextStyle(
                  fontFamily: "SF Pro Display",
                  color: AppColors.c_000000,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 16.w,right: 16.w),
              child: const Text(  "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                style: TextStyle(
                    fontFamily: "SF Pro Display",
                    color: AppColors.c_828796,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: AppColors.c_FFFFFF,
        child: Center(
          child: GlobalButton(
            text: 'Супер!',
            height: 48.h,
            width: 343.w,
            color: AppColors.c_0D72FF,
            radius: 15.r,
            textColor: AppColors.c_FFFFFF,
            textsize: 16,
            fontStyle: FontStyle.normal,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.hotelScreen);
            },
          ),
        ),
      ),
    );
  }
}
