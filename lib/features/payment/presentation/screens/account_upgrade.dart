import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';

class AccountUpgrade extends StatelessWidget {
  const AccountUpgrade({super.key});
  _buildAccountUpgradeViewBody(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h, bottom: 30.h),
      child: Column(
        children: [
          _buildLogo(),
          SizedBox(height: 27.h),
          _buildHeadline(context),
          SizedBox(height: 15.h),
          _buildSubHeadline(),
          SizedBox(height: 40.h),
          _buildSubscribePrice(context),
          const Spacer(),
          DefaultButton(
            text: AppStrings.subscribe,
            onTap: () {
              Navigator.pushNamed(context, Routes.payViewRoute);
            },
          ),
        ],
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.accountUpgrade,
      width: 160.w,
      height: 203.h,
    );
  }

  _buildHeadline(BuildContext context) {
    return Text(
      AppStrings.accountUpgrade,
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 20.sp),
    );
  }

  _buildSubHeadline() {
    return Padding(
      padding: EdgeInsets.only(left: 46.w, right: 45.w),
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.accountUpgradeDescription,
        style: getRegularStyle(color: ColorManager.grey, fontSize: 15.sp),
      ),
    );
  }

  _buildSubscribePrice(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.monthlySubscribe,
                style: getRegularStyle(
                    color: Theme.of(context).primaryColor, fontSize: 14.sp)),
            Text('50\$',
                style: getBoldStyle(
                    color: Theme.of(context).primaryColor, fontSize: 22.sp))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.accountUpgrade)),
      body: _buildAccountUpgradeViewBody(context),
    );
  }
}
