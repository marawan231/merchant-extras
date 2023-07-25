import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'available_deals_item.dart';

class AvailableDeals extends StatelessWidget {
  const AvailableDeals({super.key});
  _buildAvailableDeals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.availableDeals,
          style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
        ),
        SizedBox(height: 12.h),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AvailableDealsItem(
                index: index,
                leading: ImageAssets.orange,
                title: AppStrings.orangeFlibine,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemCount: 5)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAvailableDeals();
  }
}
