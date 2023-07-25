import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class KiloPriceAndPayment extends StatelessWidget {
  const KiloPriceAndPayment({super.key, this.kiloPrice, this.paymentMethod});
  final String? kiloPrice;
  final String? paymentMethod;
  _buildKiloPrice(BuildContext context) {
    return CustomDealDetailContainer(
      width: 165.w,
      height: 79.h,
      title: AppStrings.requiredKiloPrice.replaceAll(':', ''),
      // titleTextStyle:
      //     getBoldStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
      icon: ImageAssets.priceTag,
      value: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: kiloPrice ?? '0',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.sp)),
        TextSpan(
            text: '\$',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 12.sp))
      ])),
    );
  }

  _buildPaymentMethod(BuildContext context) {
    return CustomDealDetailContainer(
      width: 165.w,
      height: 79.h,
      title: 'طريقة الدفع',
      icon: ImageAssets.mastercard,
      value: Text(
        paymentMethod ?? '',
        style: getBoldStyle(
            color: Theme.of(context).primaryColor, fontSize: 16.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildKiloPrice(context),
        SizedBox(width: 5.w),
        _buildPaymentMethod(context),
      ],
    );
  }
}
