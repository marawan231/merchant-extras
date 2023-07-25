import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/strings_manager.dart';

class AccountVerifySuccessView extends StatelessWidget {
  const AccountVerifySuccessView({super.key});

  _buildLogo() {
    return Image.asset(
      ImageAssets.verifyLogo,
      width: 232.w,
      height: 302.h,
    );
  }

  _buildTitle() {
    return Center(
      child: Text(
        AppStrings.accountVerficaion,
        style: getBoldStyle(
          fontSize: 22.sp,
          color: ColorManager.black,
        ),
      ),
    );
  }

  _buildSubTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 65.w, right: 61.w),
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.accountVerficaionSubtitle,
        style: getRegularStyle(
          fontSize: 15.sp,
          color: ColorManager.grey,
        ),
      ),
    );
  }

  _buildButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          AppStrings.agree,
          style: getBoldStyle(
            fontSize: 17.sp,
            color: ColorManager.primary,
          ).copyWith(decoration: TextDecoration.underline),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 100.h),
        shrinkWrap: true,
        children: [
          _buildLogo(),
          _buildTitle(),
          SizedBox(height: 21.h),
          _buildSubTitle(),
          SizedBox(height: 76.h),
          _buildButton(context),
        ],
      ),
    );
  }
}
