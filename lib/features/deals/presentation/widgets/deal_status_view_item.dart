import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class DealsStatusViewItem extends StatelessWidget {
  const DealsStatusViewItem({super.key});

  _buildResultContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.dealDetailsViewRoute);
      },
      child: Container(
        // width: 335.w,
        // height: 129.h,
        decoration: BoxDecoration(
          // border: Border.all(color: ColorManager.cfGrey),
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: Stack(
          children: [
            _buildAvatar(),
            _buildDetails(),
            _buildOrderStatue(context),
          ],
        ),
      ),
    );
  }

  _buildOrderStatue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, top: 16.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          AppStrings.shipMaking,
          style: getRegularStyle(
              color: Theme.of(context).primaryColor, fontSize: 12.sp),
        ),
      ),
    );
  }

  _buildAvatar() {
    return Padding(
      padding: EdgeInsets.only(top: 34.h, right: 15.w),
      child: Image.asset(
        ImageAssets.apple,
        width: 60.w,
        height: 60.h,
      ),
    );
  }

  _buildDetails() {
    return Padding(
      padding: EdgeInsets.only(right: 90.w, top: 26.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDealNumber(),
          SizedBox(height: 7.h),
          _buildDealItemTitle(),
          SizedBox(height: 17.h),

          _buildOrderUserDetails(),
          // SizedBox(height: 6.h),
          // _buildSearchItemOwner(),
          // SizedBox(height: 13.h),
          // _buildStars(),
        ],
      ),
    );
  }

  _buildDealNumber() {
    return Text(
      AppStrings.orderNumber,
      style: getRegularStyle(color: ColorManager.black, fontSize: 11.sp),
    );
  }

  _buildDealItemTitle() {
    return Text(
      AppStrings.apple,
      style: getBoldStyle(color: ColorManager.black, fontSize: 17.sp),
    );
  }

  _buildOrderUserDetails() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Row(
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     _buildUserIcon(),
        //     SizedBox(width: 10.w),
        //     _buildUserName(),
        //   ],
        // ),
        // SizedBox(width: 5.w),
        Row(
          children: [
            _buildUserItemWeightIcon(),
            SizedBox(width: 5.w),
            _buildUserItemWeight(),
          ],
        ),
        SizedBox(width: 11.w),
        Row(
          children: [
            _buildPriceTag(),
            SizedBox(width: 5.w),
            _buildPrice(),
          ],
        ),
      ],
    );
  }

  _buildPriceTag() {
    return Image.asset(
      ImageAssets.priceTag,
      width: 12.w,
      height: 12.h,
    );
  }

  _buildPrice() {
    return Text(
      '100\$ للكيلو',
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildUserItemWeightIcon() {
    return Image.asset(
      ImageAssets.weight,
      width: 12.w,
      height: 12.h,
    );
  }

  _buildUserItemWeight() {
    return Text(
      AppStrings.resultQuantity,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 129.h,
      // color: ColorManager.error,
      child: _buildResultContainer(context),
    );
  }
}
