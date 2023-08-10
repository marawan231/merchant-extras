import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(
      {super.key,
      required this.iconData,
      required this.title,
      required this.subTitle});

  final String iconData;
  final String title;
  final String subTitle;

  _buildIcon() {
    return Image.asset(
      iconData,
      color: ColorManager.primary,
      height: 18.h,
      width: 18.w,
      fit: BoxFit.cover,
    );
  }

  // _buildTitle() {
  //   return Text(
  //     title,
  //     style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
  //   );
  // }

  _buildSubTitle(BuildContext context) {
    return Text(
      subTitle,
      style: getRegularStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          SizedBox(width: 18.w),
          _buildSubTitle(context),
        ],
      ),
    );
  }
}
