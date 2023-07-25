import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ChangeCurrencyMessage extends StatelessWidget {
  const ChangeCurrencyMessage({super.key});

  _buildChangeCurrencyMessage(BuildContext context) {
    return Container(
      width: 214.w,
      height: 37.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.03),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: AppStrings.currencyChangedFrom,
              style:
                  getRegularStyle(color: ColorManager.grey, fontSize: 12.sp)),
          WidgetSpan(
              child: SizedBox(
            width: 4.w,
          )),
          TextSpan(
              text: '\$',
              style: getRegularStyle(
                  color: Theme.of(context).primaryColor, fontSize: 12.sp)),
          WidgetSpan(
              child: SizedBox(
            width: 6.w,
          )),
          TextSpan(
              text: AppStrings.to,
              style:
                  getRegularStyle(color: ColorManager.grey, fontSize: 12.sp)),
          WidgetSpan(
              child: SizedBox(
            width: 4.w,
          )),
          TextSpan(
              text: AppStrings.ryal,
              style: getRegularStyle(
                  color: Theme.of(context).primaryColor, fontSize: 12.sp)),
          WidgetSpan(
              child: SizedBox(
            width: 5.w,
          )),
          TextSpan(
              text: AppStrings.successfully,
              style:
                  getRegularStyle(color: ColorManager.grey, fontSize: 12.sp)),
        ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChangeCurrencyMessage(context);
  }
}
