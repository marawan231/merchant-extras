import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {super.key,
      required this.title,
      required this.subtTitle,
      required this.icon});

  final String title;
  final String subtTitle;
  final IconData icon;
  _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
        ),
        const Spacer(),
        Text(
          subtTitle,
          style: getBoldStyle(
              color: Theme.of(context).primaryColor, fontSize: 16.sp),
        ),
      ],
    );
  }

  _buildIcon(BuildContext context) {
    return Icon(
      icon,
      color: Theme.of(context).primaryColor,
      size: 15.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 79.h,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding:
            EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h, bottom: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const Spacer(),
            _buildIcon(context),
          ],
        ),
      ),
    );
  }
}
