import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  Widget _buildResendCode(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: AppStrings.resendCodeHint,
            style:
                getRegularStyle(color: ColorManager.darkGrey, fontSize: 16.sp),
            children: [
              WidgetSpan(child: SizedBox(width: 8.w)),
              TextSpan(
                text: AppStrings.resendCode,
                style: getMediumStyle(
                    color: ColorManager.primary, fontSize: 16.sp),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildResendCode(context);
  }
}
