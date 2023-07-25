import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  _buildCloseButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.h, right: 45.w),
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: ColorManager.white),
        child: Icon(
          Icons.close,
          color: Theme.of(context).primaryColor,
          size: 10.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCloseButton(context);
  }
}
