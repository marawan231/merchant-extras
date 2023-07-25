import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class TamweelItem extends StatelessWidget {
  const TamweelItem({super.key});

  _buildResultContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.tamweelItemDetailsViewRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItemImage(),
          _buildResultItemDetails(),
          _buildArrow(context),
        ],
      ),
    );
  }

  _buildItemImage() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Image.asset(
        ImageAssets.apple,
        width: 60.w,
        height: 60.h,
      ),
    );
  }

  _buildResultItemDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTamweelItemTitle(),
          SizedBox(height: 8.h),
          _buildWantedQuantity(),
          SizedBox(height: 8.h),
          _buildPriceForUnit(),
          SizedBox(height: 8.h),
          _buildLocationValue(),
        ],
      ),
    );
  }

  _buildWantedQuantity() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.weight,
          width: 14.w,
          height: 14.h,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.wantedQuantityValue,
          style: getRegularStyle(color: ColorManager.grey, fontSize: 13.sp),
        )
      ],
    );
  }

  _buildTamweelItemTitle() {
    return Text(
      AppStrings.resultTitle,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildPriceForUnit() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.priceTag,
          width: 14.w,
          height: 14.h,
        ),
        SizedBox(width: 10.w),
        Text(
          '${AppStrings.priceForPound}1000\$',
          style: getRegularStyle(color: ColorManager.grey, fontSize: 13.sp),
        ),
      ],
    );
  }

  _buildLocationValue() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.location,
          width: 14.w,
          height: 14.h,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.kewit,
          style: getRegularStyle(color: ColorManager.grey, fontSize: 10.sp),
        ),
      ],
    );
  }

  _buildArrow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor, size: 12.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 146.h,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: _buildResultContainer(context),
    );
  }
}
