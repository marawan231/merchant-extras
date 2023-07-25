import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class SesrchResultItemDetailsButtons extends StatelessWidget {
  const SesrchResultItemDetailsButtons({super.key});

 _buildChargeButton() {
    return Padding(
      padding: EdgeInsets.only(right: 180.w, top: 20.h),
      child: Container(
        width: 135.w,
        height: 37.h,
        decoration: BoxDecoration(
            color: ColorManager.white.withOpacity(.1),
            border: Border.all(color: ColorManager.white, width: .5.sp),
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: ColorManager.white,
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                AppStrings.charge,
                style:
                    getRegularStyle(color: ColorManager.white, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildChargeButton();
  }
}