import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels/bloc/booking_bloc/booking_bloc.dart';
import 'package:hotels/ui/hotel/widget/bottom/bottom.dart';
import 'package:hotels/utils/app_color/app_color.dart';
import 'package:hotels/utils/app_icons/app_icons.dart';
import 'package:hotels/utils/routs/approuts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'widget/booking_text/booking_text_data.dart';
import 'widget/container_booking/plays_information.dart';
import 'widget/line_text/line_text.dart';
import 'widget/person_data/person_data.dart';
import 'widget/rating_name/rating_name_widget.dart';
import 'widget/text_filds/person_text_filds.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var contactFormatter = MaskTextInputFormatter(
    mask: '+7(###)###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var emailFormatter = MaskTextInputFormatter(
    mask: '####################',
    filter: {
      "#": RegExp(r'[a-zA-Z0-9@\.\-_]'),
    },
  );

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.numberScreen);
          },
          icon: SvgPicture.asset(AppIcons.leviyNazad),
        ),
        elevation: 0,
        backgroundColor: AppColors.c_FFFFFF,
        automaticallyImplyLeading: false,
        title: const Text(
          "Бронирование",
          style: TextStyle(
            fontFamily: "SF Pro Display",
            color: AppColors.c_000000,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: AppColors.c_F6F6F9,
      body: BlocConsumer<BookingBloc, BookingState>(
        builder: (BuildContext context, BookingState state) {
          return ListView(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 8.r),
                child: Container(
                  width: double.infinity,
                  height:160.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.c_FFFFFF,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RatingName(
                            width: 149.w,
                            height:29.h,
                            fontWeight: FontWeight.w500,
                            text:
                                "\t${state.bookingModel.horating}\t${state.bookingModel.ratingName}",
                            textColor: AppColors.c_fffa800,
                            fontColor: AppColors.c_fffc700.withOpacity(0.2),
                            fontStyle: FontStyle.normal,
                            textSize: 16,
                            radius: 5.r,
                            picture: AppIcons.zvezda,
                          ),
                        ),
                      ),
                      Bookingtext(
                        left: 16.w,
                        top: 8.h,
                        fontsize: 22,
                        text: state.bookingModel.hotelName,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_000000,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Bookingtext(
                          left: 16.w,
                          top: 8.h,
                          fontsize: 14,
                          text: state.bookingModel.hotelAdress,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_0D72FF,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: PlaySinformation(
                  height: 280.h,
                  width: double.infinity,
                  bagroudcolor: AppColors.c_FFFFFF,
                  radius: 12.r,
                  column: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Вылет из',
                          text2: state.bookingModel.departure,
                          widts:98.w,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Страна, город',
                          text2: state.bookingModel.arrivalCountry,
                          widts: MediaQuery.of(context).size.width * 0.18,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Даты',
                          text2:
                              "${state.bookingModel.tourDateStart}-${state.bookingModel.tourDateStop}",
                          widts:120.w,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Кол-во ночей',
                          text2: "${state.bookingModel.numberOfNights}  ночей",
                          color: AppColors.c_000000,
                          widts: 76.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Отель',
                          text2: "Steigenberger Makadi",
                          widts: 115.w,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Номер',
                          text2: state.bookingModel.room,
                          widts: 109.w,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                        child: LineText(
                          text1: 'Питание',
                          text2: state.bookingModel.nutrition,
                          widts: 99.w,
                          color: AppColors.c_000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              PlaySinformation(
                width: 375.w,
                height: 240.h,
                bagroudcolor: AppColors.c_FFFFFF,
                radius: 12,
                column: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Bookingtext(
                        left: 16.w,
                        top: 16.h,
                        fontsize: 22,
                        text: 'Информация о покупателе',
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_000000,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: textEditingController,
                        labeltext: 'Номер телефона',
                        textInputFormatter: [contactFormatter],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: textEditingController,
                        labeltext: 'examplemail.000@mail.ru',
                        textInputFormatter: [emailFormatter],
                      ),
                    ),
                    Bookingtext(
                      left: 16.w,
                      top: 16.h,
                      fontsize: 14,
                      text:
                          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      fontWeight: FontWeight.w400,
                      color: AppColors.c_828796,
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 8.h,
              ),
              const PersonData(
                turistName: 'Первый турист ',
                icon1: Icons.keyboard_arrow_up_sharp,
                icon2: Icons.keyboard_arrow_down_sharp,
              ),
              SizedBox(
                height: 8.h,
              ),
              const PersonData(
                turistName: 'Второй турист ',
                icon1: Icons.keyboard_arrow_up_sharp,
                icon2: Icons.keyboard_arrow_down_sharp,
              ),
              SizedBox(
                height: 8.h,
              ),
              const PersonData(
                  turistName: 'Добавить туриста',
                  icon1: Icons.close,
                  icon2: Icons.add),
              SizedBox(
                height: 8.h,
              ),
              PlaySinformation(
                height: 156.h,
                width: double.infinity,
                bagroudcolor: AppColors.c_FFFFFF,
                radius: 12.r,
                column: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: LineText(
                        text1: 'Тур',
                        text2: "${state.bookingModel.tourPrice.toString()}\t₽",
                        widts: 179.w,
                        color: AppColors.c_000000,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                      child: LineText(
                        text1: 'Топливный сбор',
                        text2: "${state.bookingModel.fuelCharge.toString()}\t₽",
                        widts: 99.w,
                        color: AppColors.c_000000,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                      child: LineText(
                        text1: 'Сервисный сбор',
                        text2:
                            "${state.bookingModel.serviceCharge.toString()}\t₽",
                        widts: 97.w,
                        color: AppColors.c_000000,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 16.w, top: 16.w),
                      child: LineText(
                        text1: 'К оплате',
                        text2:
                            "${(state.bookingModel.tourPrice + state.bookingModel.fuelCharge + state.bookingModel.serviceCharge).toString()}\t₽",
                        widts: 148.w,
                        color: AppColors.c_0D72FF,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, BookingState state) {},
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: AppColors.c_FFFFFF,
        child: Center(
          child: GlobalButton(
            text:
                'Оплатить ${(context.watch<BookingBloc>().state.bookingModel.tourPrice + context.watch<BookingBloc>().state.bookingModel.fuelCharge + context.watch<BookingBloc>().state.bookingModel.serviceCharge)}₽',
            height: 48.h,
            width: 343.w,
            color: AppColors.c_0D72FF,
            radius: 15.r,
            textColor: AppColors.c_FFFFFF,
            textsize: 16,
            fontStyle: FontStyle.normal,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.orderhaseBeenScreen);
            },
          ),
        ),
      ),
    );
  }
}
