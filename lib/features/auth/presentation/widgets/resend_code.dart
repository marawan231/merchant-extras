import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ResendCode extends StatelessWidget {

  const ResendCode({super.key});

    Widget _buildResendCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 125.w),
      child: InkWell(
          onTap: () {},
          child: Text(
            AppStrings.resendCode,
            style: getBoldStyle(
                    color: Theme.of(context).primaryColor, fontSize: 14.sp)
                .copyWith(
              decoration: TextDecoration.underline,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildResendCode(context);
  }
}