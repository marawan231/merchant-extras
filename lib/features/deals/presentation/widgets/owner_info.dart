import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class DealOwnerInfo extends StatelessWidget {
  const DealOwnerInfo({super.key});

  _buildOwnerInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAvatar(),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUsername(),
            SizedBox(height: 4.w),
            Row(
              children: [
                _buildUserIcon(),
                SizedBox(width: 10.w),
                _buildOwnerRole(),
                SizedBox(width: 14.w),
                _buildRate(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _buildAvatar() {
    return Image.asset(
      ImageAssets.avatar,
      width: 65.w,
      height: 60.h,
    );
  }

  _buildUsername() {
    return Text(
      AppStrings.username,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildUserIcon() {
    return Image.asset(
      ImageAssets.user,
      width: 12.w,
      height: 12.h,
    );
  }

  _buildOwnerRole() {
    return Text(
      AppStrings.buyer,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  _buildRate() {
    return Image.asset(
      ImageAssets.stars,
      width: 85.w,
      height: 13.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildOwnerInfo();
  }
}
