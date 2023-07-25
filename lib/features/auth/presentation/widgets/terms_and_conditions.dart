import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: AppStrings.agreeTo,
            style:
                getRegularStyle(color: ColorManager.darkGrey, fontSize: 14.sp)),
        TextSpan(
            text: AppStrings.termsAndConditions,
            style: getRegularStyle(
                color: Theme.of(context).primaryColor, fontSize: 14.sp)),
      ]),
    );
  }
}
