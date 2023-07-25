import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      style: titleTextStyle ?? Theme.of(context).textTheme.headlineSmall,
    );
  }

  _buildValue(context) {
    return value;
  }

  _buildIcon() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Image.asset(
        icon,
        width: iconWidth ?? 15.w,
        height: iconHeight ?? 15.h,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 79.h,
      decoration: BoxDecoration(
          color: color ?? ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 10.h, left: 15.w, right: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle(context),
                _buildValue(context),
              ],
            ),
            _buildIcon(),
          ],
        ),
      ),
    );
  }
}
