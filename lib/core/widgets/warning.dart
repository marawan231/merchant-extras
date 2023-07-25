import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/route_manager.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

class Warning extends StatelessWidget {
  const Warning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(color: ColorManager.red.withOpacity(.05)),
      child: Padding(
        padding: EdgeInsets.only(right: 36.w, left: 36.w),
        child: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: ColorManager.red,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: AppStrings.warningMessage,
                    style: getRegularStyle(
                        color: ColorManager.red, fontSize: 13.sp)),
                WidgetSpan(child: SizedBox(width: 8.w)),
                TextSpan(
                    style: getRegularStyle(
                            color: ColorManager.red, fontSize: 13.sp)
                        .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    text: AppStrings.fromHere,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context, Routes.accountVerficationViewRoute);
                      }),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
