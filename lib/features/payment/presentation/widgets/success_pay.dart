import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/widgets/default_button.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/style_manager.dart';

class SuccessPay extends StatelessWidget {
  const SuccessPay({super.key});
  _buildLogo() {
    return Image.asset(
      ImageAssets.successLogo,
      height: 123.h,
      width: 123.w,
    );
  }

  _buildTitle() {
    return Text(
      'تم الدفع بنجاح',
      style: getBoldStyle(fontSize: 30.sp, color: ColorManager.black),
    );
  }

  _buildSubtitle() {
    return Text(
      'لقد تمت عملية الدفع بنجاح يمكنك متابعة الصفقة من خلال الزر ادناه',
      textAlign: TextAlign.center,
      style: getRegularStyle(
          fontSize: 15.sp, color: ColorManager.grey.withOpacity(.9)),
    );
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: 'متابعة الصفقة',
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainhomeviewRoute, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: 24.w,
          left: 24.w,
          bottom: 43.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 50.w, left: 50.w, top: 185.w),
              child: Center(
                child: Column(
                  children: [
                    _buildLogo(),
                    30.verticalSpace,
                    _buildTitle(),
                    6.verticalSpace,
                    _buildSubtitle(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            _buildButton(context),
          ],
        ),
      ),
    );
  }
}
