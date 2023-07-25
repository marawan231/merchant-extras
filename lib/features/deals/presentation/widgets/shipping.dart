import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'custom_deal_detail_container.dart.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key, this.cityName});
final String? cityName;
  @override
  Widget build(BuildContext context) {
    return CustomDealDetailContainer(
        title: AppStrings.shipTo,
        icon: ImageAssets.location,
        value: Text(
          cityName ?? '',
          style: getBoldStyle(
            fontSize: 16.sp,
            color: ColorManager.primary,
          ),
        ));
  }
}
