import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ClockTime extends StatelessWidget {
  const ClockTime({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.access_time,
          color: color,
          size: 13.sp,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.time,
          style: getRegularStyle(color: color, fontSize: 11.sp),
        )
      ],
    );
  }
}
