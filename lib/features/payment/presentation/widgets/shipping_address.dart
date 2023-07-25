import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ShippmentAdress extends StatelessWidget {
  const ShippmentAdress({super.key});

  _buildShipTo(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        SizedBox(height: 15.h),
        _buildContainer(context),
      ],
    );
  }

  _buildContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49.h,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          )),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Row(
          children: [
            Text(
              AppStrings.kewit,
              style: getRegularStyle(color: ColorManager.grey, fontSize: 17.sp),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).primaryColor,
              size: 16.sp,
            )
          ],
        ),
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.shipTo,
          style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildShipTo(context);
  }
}
