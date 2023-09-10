import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_event.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_state.dart';
import 'package:hotels/bloc/number_bloc/number_bloc.dart';
import 'package:hotels/utils/app_color/app_color.dart';
import 'package:hotels/utils/app_icons/app_icons.dart';
import 'package:hotels/utils/routs/approuts.dart';
import 'widget/bottom/bottom.dart';
import 'widget/convenience/convenience.dart';
import 'widget/hotel_carusel_slider/hotel_carusel_slider.dart';
import 'widget/otel_data/otel_danie.dart';
import 'widget/padding_data1/padding_data1.dart';
import 'widget/text_data/text_data.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_FFFFFF,
        elevation: 0,
        title: const Text(
          "Отель",
          style: TextStyle(
              fontFamily: "SF Pro Display",
              color: AppColors.c_000000,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColors.c_F6F6F9,
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          return ListView(
            children: [
              Stack(
                children: [
                   HotelCaruselSlider(
                          image: state.user.imageUrls,
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                        ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.47,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.c_FFFFFF,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 253.h,
                    ),
                    child: Container(
                        width: 147.w,
                        height: 29.h,
                        decoration: BoxDecoration(
                            color: AppColors.c_fffc700.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.zvezda),
                            Text(
                              "\t${state.user.rating.toString()}\t${state.user.ratingName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  color: AppColors.c_fffa800),
                            ),
                          ],
                        )),
                  ),
                  Mytext(
                    top: 285.h,
                    left: 16.w,
                    fontsize: 22,
                    text: 'Steigenberger Makadi',
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_000000,
                  ),
                  Mytext(
                    top: 320.h,
                    left: 16.w,
                    fontsize: 14,
                    text: state.user.address,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_0D72FF,
                  ),
                  Price(
                    text1: state.user.minimalPrice.toString(),
                    text2: state.user.priceForIt,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 480.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.c_FFFFFF,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Mytext(
                        top: 16.h,
                        left: 16.w,
                        fontsize: 22,
                        text: "Об отеле",
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_000000,
                      ),
                    ),
                    ...List.generate(
                        state.user.aboutTheHotel.peculiarities.length,
                        (index) => Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Danie(
                                    height: 29.h,
                                    text: state.user.aboutTheHotel
                                        .peculiarities[index],
                                    top: 5.h,
                                    left: 10.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 18.h,
                                ),
                              ],
                            )),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child:
                          Text(state.user.aboutTheHotel.description.toString()),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Convenience(),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (context, state) {},
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: AppColors.c_FFFFFF,
        child: Center(
          child: GlobalButton(
            text: 'К выбору номера',
            height: 48.h,
            width: 343.w,
            color: AppColors.c_0D72FF,
            radius: 15,
            textColor: AppColors.c_FFFFFF,
            textsize: 16,
            fontStyle: FontStyle.normal,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.numberScreen);
              context.read<NumberBloc>().add(GetNumber(id: 1));
            },
          ),
        ),
      ),
    );
  }
}
