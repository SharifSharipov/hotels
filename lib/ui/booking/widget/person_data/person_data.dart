import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels/ui/booking/widget/text_filds/person_text_filds.dart';
import '../../../../utils/app_color/app_color.dart';
class PersonData extends StatefulWidget {
  const PersonData(
      {super.key,
      required this.turistName,
      required this.icon1,
      required this.icon2});
  final String turistName;
  final IconData icon1;
  final IconData icon2;

  @override
  State<PersonData> createState() => _PersonDataState();
}

class _PersonDataState extends State<PersonData> {
  bool isAccordionOpen = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.c_FFFFFF),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAccordionOpen = !isAccordionOpen;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 16.h,left: 16.w),
                    child: Text(
                      widget.turistName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.normal,
                        color: AppColors.c_000000,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 12.h,right: 16.w),
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.c_0D72FF.withOpacity(0.2),
                      ),
                      child: Icon(
                        (isAccordionOpen ? widget.icon1 : widget.icon2)
                            as IconData?,
                        color: AppColors.c_0D72FF,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isAccordionOpen)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  color: AppColors.c_FFFFFF,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Имя',
                        textInputFormatter: [],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Фамилия',
                        textInputFormatter: [],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Дата рождения',
                        textInputFormatter: [],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Гражданство',
                        textInputFormatter: [],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Номер загранпаспорта',
                        textInputFormatter: [],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                      child: GlobalTextFilds(
                        controllerl: controller,
                        labeltext: 'Срок действия загранпаспорта',
                        textInputFormatter: [],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}


