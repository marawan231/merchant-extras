import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'switch.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class NegotiationOption extends StatelessWidget {
  const NegotiationOption({super.key});

   _buildNegotiateOption(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62.h,
      decoration: BoxDecoration(
          color: ColorManager.grey.withOpacity(.10),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.box,
              color: Theme.of(context).primaryColor,
              size: 14.sp,
            ),
            SizedBox(width: 10.w),
            Text(
              AppStrings.sendSample,
              style:
                  getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
            ),
            const Spacer(),
            const CustomSwitch(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNegotiateOption(context);
  }
}