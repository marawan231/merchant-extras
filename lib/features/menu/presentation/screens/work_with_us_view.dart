import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class WorkWithUsView extends StatelessWidget {
  const WorkWithUsView({super.key});

  _buildWorkWithUsViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 60.h),
      child: Column(
        children: [
          _buildLogo(),
          SizedBox(height: 27.h),
          _buildTitle(context),
          SizedBox(height: 17.h),
          _buildSubtitle(),
          SizedBox(height: 60.h),
          _buildNumber(context),
        ],
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.ambassadorPana,
      width: 312.w,
      height: 338.h,
    );
  }

  _buildTitle(BuildContext context) {
    return Text(
      AppStrings.welcomeAs,
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 20.sp),
    );
  }

  _buildSubtitle() {
    return Text(
      AppStrings.yourPersonalNumber,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  _buildNumber(BuildContext context) {
    return Row(
      children: [
        _buildPhoneNumber(context),
        SizedBox(width: 10.w),
        _buildCopy(context),
      ],
    );
  }

  _buildPhoneNumber(BuildContext context) {
    return Container(
      width: 223.w,
      height: 56.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
        child: Text(
          refferNumber,
          style: getRegularStyle(color: ColorManager.white, fontSize: 22.sp),
        ),
      ),
    );
  }

  _buildCopy(BuildContext context) {
    return Container(
      width: 82.w,
      height: 56.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: InkWell(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: refferNumber)).then(
              (value) => Commons.showToast(
                  message: AppStrings.copiedSuccessufully,
                  color: ColorManager.green));
        },
        child: Image.asset(
          ImageAssets.contentCopyRounded,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.workAs)),
      body: _buildWorkWithUsViewBody(context),
    );
  }
}
