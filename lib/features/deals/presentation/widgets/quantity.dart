import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class Quantity extends StatelessWidget {
  const Quantity({super.key, this.amount});
  final String? amount;
  _buildQuantity(BuildContext context) {
    return CustomDealDetailContainer(
      title: AppStrings.quantity,
      icon: ImageAssets.weight,
      iconHeight: 15.h,
      iconWidth: 15.w,
      value: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: amount ?? '',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.sp)),
        WidgetSpan(
            child: SizedBox(
          width: 5.w,
        )),
        TextSpan(
            text: AppStrings.kilo,
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 12.sp))
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuantity(context);
  }
}
