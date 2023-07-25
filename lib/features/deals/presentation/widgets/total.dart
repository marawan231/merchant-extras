import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class Total extends StatelessWidget {
  const Total({super.key, this.total});
  final String? total;
  _buildTotalAmount(BuildContext context) {
    return CustomDealDetailContainer(
      title: AppStrings.totla,
      icon: ImageAssets.priceTag,
      // value: Text(
      //   '$total ${'\$'}',
      //   style: getBoldStyle(
      //       color: Theme.of(context).primaryColor, fontSize: 20.sp),
      // ),
      value: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: total ?? '',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.sp)),
        WidgetSpan(
          child: SizedBox(width: 5.w),
        ),  
        TextSpan(
            text: '\$',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 12.sp)),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTotalAmount(context);
  }
}
