import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels/bloc/booking_bloc/booking_bloc.dart';
import 'package:hotels/bloc/number_bloc/number_bloc.dart';
import 'package:hotels/utils/app_color/app_color.dart';
import 'package:hotels/utils/app_icons/app_icons.dart';
import 'package:hotels/utils/routs/approuts.dart';
import '../hotel/widget/bottom/bottom.dart';
import 'widget/carusel_silder/carusel_slider.dart';
import 'widget/exact_number.dart';
import 'widget/number_data/number_particulars.dart';
import 'widget/number_text_data/number_text_data.dart';
class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.hotelScreen);
          },
          icon: SvgPicture.asset(AppIcons.leviyNazad),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.c_FFFFFF,
        title: const Text(
          "Steigenberger Makadi",
          style: TextStyle(
              fontFamily: "SF Pro Display",
              color: AppColors.c_000000,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColors.c_F6F6F9,
      body: BlocConsumer<NumberBloc, NumberState>(
        builder: (BuildContext context, NumberState state) {
          print(state.rooms.length);
          return ListView(
            children: [
              ...List.generate(
                state.rooms.length,
                (index) => Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Container(
                        height: 500.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.c_FFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      //Shimmers
                      padding: EdgeInsets.only(top: 30.h),
                      child:  MyCarouselSlider(
                              height: 257.h,
                              image: state.rooms[index].imageUrls,
                              width: double
                                  .infinity /*MediaQuery.of(context).size.width*/,
                            ),
                    ),
                    Mynumbertext(
                      left: 16.w,
                      top: 285.h,
                      fontsize: 22,
                      text: state.rooms[index].name,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_000000,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 315.h, left: 16.w),
                          child: NumberParticulars(
                            height: 29.h,
                            text: state.rooms[index].peculiarities.first,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            textcolor: AppColors.c_828796,
                            fontsize: 16,
                            radius: 5.r,
                            conteynerFontColor: AppColors.c_FBFBFC,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 315.h, left: 16.w),
                          child: NumberParticulars(
                            height: 29.h,
                            text: state.rooms[index].peculiarities.last,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            textcolor: AppColors.c_828796,
                            fontsize: 16,
                            radius: 5.r,
                            conteynerFontColor: AppColors.c_FBFBFC,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Mynumbertext(
                          left: 16.w,
                          top: 340.h,
                          fontsize: 30.h,
                          text: "${state.rooms[index].price.toString()}\t₽",
                          fontWeight: FontWeight.w600,
                          color: AppColors.c_000000,
                        ),
                        Mynumbertext(
                          left: 16.w,
                          top: 340.h,
                          fontsize: 16,
                          text: state.rooms[index].pricePer,
                          fontWeight: FontWeight.w400,
                          color: AppColors.c_828796,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 390.h, left: 16.w),
                      child: ExactNumber(
                        fontColor: AppColors.c_0D72FF.withOpacity(0.1),
                        text: 'Подробнее о номере',
                        fontWeight: FontWeight.w500,
                        width: 180,
                        height: 30,
                        textColor: AppColors.c_0D72FF,
                        textSize: 16,
                        radius: 0,
                        picture: AppIcons.buttonSiniy,
                      ),
                    ),
                    Positioned(
                      top: 435.h,
                      left: 15.w,
                      child: GlobalButton(
                        text: 'Выбрать номер',
                        height: 43.h,
                        width: 343.w,
                        color: AppColors.c_0D72FF,
                        radius: 15.r,
                        textColor: AppColors.c_FFFFFF,
                        textsize: 22,
                        fontStyle: FontStyle.normal,
                        onPressed: () {
                          context.read<BookingBloc>().add(GetMybooking(id: 1));
                          Navigator.pushNamed(
                              context, RouteNames.bookingScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, NumberState state) {},
      ),
    );
  }
}
