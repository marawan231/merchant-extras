import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class Headline extends StatelessWidget {
  const Headline(
      {super.key,
      required this.title,
      this.icon,
      this.iconHeight,
      this.iconWidth,
      this.textColor});

  final String title;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  final Color? textColor;

  _buildHeadlineOfTextField() {
    return Row(
      children: [
        _buildIcon(),
        SizedBox(width: 12.w),
        _buildText(),
      ],
    );
  }

  _buildIcon() {
    return icon == null
        ? const SizedBox.shrink()
        : Image.asset(
            icon!,
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.fill,
          );
  }

  _buildText() {
    return Text(
      title,
      style: getBoldStyle(
          color: textColor ?? ColorManager.darkGrey, fontSize: 17.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHeadlineOfTextField();
  }
}
