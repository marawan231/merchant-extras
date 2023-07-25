import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class Seller extends StatelessWidget {
  const Seller({super.key});
  _buildSellerDetails(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.dealOwnerRoute);
      },
      child: Container(
        width: double.infinity,
        height: 90.h,
        decoration: BoxDecoration(
          // border: Border.all(color: ColorManager.cfGrey),
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 15.h, left: 20.w, right: 12.w, bottom: 15.h),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAvatar(),
              SizedBox(width: 15.w),
              _buildItemDetails(),
              const Spacer(),
              _buildArrow(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildAvatar() {
    return Image.asset(
      ImageAssets.avatar,
      width: 60.w,
      height: 60.h,
    );
  }

  _buildItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSearchItemTitle(),
        SizedBox(height: 11.h),
        _buildEnterToPage(),
      ],
    );
  }

  _buildSearchItemTitle() {
    return Text(
      AppStrings.username,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildEnterToPage() {
    return Text(
      AppStrings.enterSellerPage,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 11.sp),
    );
  }

  _buildArrow(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      child: Icon(Icons.arrow_back_ios_new,
          color: Theme.of(context).primaryColor, size: 16.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSellerDetails(context);
  }
}
