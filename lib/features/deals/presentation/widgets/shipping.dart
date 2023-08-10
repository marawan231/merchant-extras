import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key, this.cityName, this.paymentMethod});
  final String? cityName;
  final String? paymentMethod;

  _buildShippingTo(BuildContext context) {
    return Expanded(
      child: CustomDealDetailContainer(
          title: AppStrings.shipTo,
          icon: ImageAssets.location,
          value: Padding(
            padding: EdgeInsets.only(top: 15.h, right: 22.w),
            child: Text(
              cityName ?? '',
              style: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
            ),
          )),
    );
  }

  _buildPayMethod(BuildContext context) {
    return Expanded(
      child: CustomDealDetailContainer(
        // width: 165.w,
        // height: 79.h,
        title: AppStrings.payMethod,
        icon: ImageAssets.mastercard,
        value: Padding(
          padding: EdgeInsets.only(right: 22.w),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.wallet,
                height: 18.h,
                width: 18.w,
              ),
              18.horizontalSpace,
              Text(
                paymentMethod ?? '',
                style:
                    getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildShippingTo(context),
        12.horizontalSpace,
        _buildPayMethod(context),
      ],
    );
  }
}
