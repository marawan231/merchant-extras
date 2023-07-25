import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class Buyer extends StatelessWidget {
  const Buyer({super.key});
  _buildBuuyerDetails(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        // border: Border.all(color: ColorManager.cfGrey),
        color: ColorManager.lightWhite,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAvatar(),
          _buildItemDetails(),
          _buildArrow(context),
        ],
      ),
    );
  }

  _buildAvatar() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Image.asset(
        ImageAssets.avatar,
        width: 65.w,
        height: 60.h,
      ),
    );
  }

  _buildItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22.h),
        _buildSearchItemTitle(),
        SizedBox(height: 11.h),
        Row(
          children: [
            _buildBuyerReviewTitle(),
            _buildStars(),
          ],
        )
      ],
    );
  }

  _buildBuyerReviewTitle() {
    return Text(
      AppStrings.buyerReview,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 11.sp),
    );
  }

  _buildSearchItemTitle() {
    return Text(
      AppStrings.username,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildStars() {
    return Image.asset(
      ImageAssets.stars,
      width: 85.w,
      height: 13.h,
    );
  }

  _buildArrow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.h),
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(25.r))),
        child: Icon(Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor, size: 16.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBuuyerDetails(context);
  }
}
