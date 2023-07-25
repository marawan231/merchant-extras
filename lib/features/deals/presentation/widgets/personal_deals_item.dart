import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class PersonalDealsItem extends StatelessWidget {
  const PersonalDealsItem({super.key});
//todo add setting icon
  _buildLeadingImage() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 20.w),
      child: Image.asset(
        ImageAssets.orange,
        width: 65.w,
        height: 65.h,
      ),
    );
  }

  _buildDealElemntDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 31.h, right: 100.w),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildInfoSellAndBuy(),
        ],
      ),
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.orangeFlibine,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildInfoSellAndBuy() {
    return Row(
      children: [
        _buildIcon(),
        SizedBox(width: 8.w),
        _buildBuyCount(),
        SizedBox(width: 7.w),
        _buildIcon(),
        SizedBox(width: 8.w),
        _buildNegotiateCount(),
      ],
    );
  }

  _buildIcon() {
    return Image.asset(
      ImageAssets.user,
      width: 10.w,
      height: 10.h,
    );
  }

  _buildBuyCount() {
    return Text(
      AppStrings.fiftyBuy,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  _buildNegotiateCount() {
    return Text(
      AppStrings.fiftyNegotiate,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  _buildDealStatue() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 15.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          AppStrings.underReview,
          style: getBoldStyle(color: ColorManager.gold, fontSize: 10.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: ColorManager.cfGrey.withOpacity(.5), width: 1.sp),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          )),
      child: Stack(
        children: [
          _buildLeadingImage(),
          _buildDealElemntDetails(),
          _buildDealStatue(),
        ],
      ),
    );
  }
}
