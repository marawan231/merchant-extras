import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class FloatingContainer extends StatelessWidget {
  const FloatingContainer(
      {super.key,
      required this.ontap,
      required this.title,
      this.width,
      this.height});
  final void Function()? ontap;
  final String title;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width ?? 226.w,
        height: height ?? 41.h,
        decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: BorderRadius.all(Radius.circular(25.r))),
        child: Center(
            child: Text(
          title,
          style: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
        )),
      ),
    );
  }
}
