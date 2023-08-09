import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import '../../../../core/resources/color_manager.dart';

class CustomDealDetailContainer extends StatelessWidget {
  const CustomDealDetailContainer({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.width,
    this.height,
    this.color,
    this.titleTextStyle,
    this.iconWidth,
    this.iconHeight,
  });

  final String title;
  final Widget value;
  final String icon;
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? titleTextStyle;
  final double? iconWidth;
  final double? iconHeight;

  _buildTitle(BuildContext context) {
    return Text(
      title,
      style: titleTextStyle ??
          getBoldStyle(fontSize: 17.sp, color: ColorManager.black),
    );
  }

  _buildValue(context) {
    return value;
  }

  // _buildIcon() {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 4.h),
  //     child: Image.asset(
  //       icon,
  //       width: iconWidth ?? 15.w,
  //       height: iconHeight ?? 15.h,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        14.verticalSpace,
        Container(
          width: width ?? double.infinity,
          height: height ?? 54.h,
          decoration: BoxDecoration(
              color: color ?? ColorManager.lightWhite,
              border: Border.all(color: ColorManager.borderInInputTextFiefld),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: _buildValue(context),
        ),
      ],
    );
  }
}
