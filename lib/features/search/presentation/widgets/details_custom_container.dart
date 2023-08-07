import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class DetailsCustomContainer extends StatelessWidget {
  const DetailsCustomContainer(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding:
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          border: Border.all(
            width: 1.sp,
            color: ColorManager.borderInInputTextFiefld,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getRegularStyle(fontSize: 15.sp, color: ColorManager.black),
          ),
          Text(
            value,
            style: getRegularStyle(fontSize: 15.sp, color: ColorManager.black),
          ),
        ],
      ),
    );
  }
}
