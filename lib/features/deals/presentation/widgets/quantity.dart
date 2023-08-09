import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class Quantity extends StatelessWidget {
  const Quantity({super.key, this.amount, this.piecePrice});
  final String? amount;
  final String? piecePrice;
  _buildQuantity(BuildContext context) {
    return Expanded(
      child: CustomDealDetailContainer(
        title: AppStrings.quantity.replaceAll(':', ''),
        icon: ImageAssets.weight,
        iconHeight: 15.h,
        iconWidth: 15.w,
        value: Center(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: amount ?? '',
              style: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
            ),
            WidgetSpan(
                child: SizedBox(
              width: 5.w,
            )),
            TextSpan(
              text: AppStrings.piece,
              style: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
            )
          ])),
        ),
      ),
    );
  }

  _buildPrice(context) {
    return Expanded(
      child: CustomDealDetailContainer(
        title: AppStrings.piecePrice,
        icon: ImageAssets.weight,
        iconHeight: 15.h,
        iconWidth: 15.w,
        value: Center(
          child: Text(
            '${piecePrice ?? ''} \$',
            style: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantity(context),
        9.horizontalSpace,
        _buildPrice(context),
      ],
    );
  }
}
