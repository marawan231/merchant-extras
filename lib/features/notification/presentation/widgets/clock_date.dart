import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ClockDate extends StatelessWidget {
  const ClockDate({super.key, required this.color,  this.date});
  final Color color;
  final String? date;
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
          date ?? AppStrings.date,
          style: getRegularStyle(color: color, fontSize: 11.sp),
        )
      ],
    );
  }
}
