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
  _buildHeadline() {
    return Row(
      children: [
        _buildIcon(),
        SizedBox(width: 12.w),
        _buildTitle(),
      ],
    );
  }

  _buildIcon() {
    return SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        iconData,
        color: ColorManager.darkGrey,
        height: 15.h,
        width: 15.w,
      ),
    );
  }

  _buildTitle() {
    return Text(
      title,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  _buildSubTitle(BuildContext context) {
    return Text(
      subTitle,
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 15.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 86.h,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadline(),
            SizedBox(height: 8.h),
            _buildSubTitle(context),
          ],
        ),
      ),
    );
  }
}
