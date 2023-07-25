import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_button.dart';
import 'close_button.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class PersonalVideo extends StatelessWidget {
  const PersonalVideo({super.key});
  _buildHeadline() {
    return Row(
      children: [
        _buildIcon(),
        SizedBox(width: 12.w),
        _buildText(),
      ],
    );
  }

  _buildIcon() {
    return Image.asset(ImageAssets.play);
  }

  _buildText() {
    return Text(
      AppStrings.personalVideo,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  _buildMyPersonalVideo() {
    return Row(
      children: [
        const AddButton(),
        SizedBox(width: 15.w),
        _buldVideoItem(),
      ],
    );
  }

  _buldVideoItem() {
    return Stack(
      children: [
        SizedBox(
          width: 136.w,
          height: 85.h,
          child: Image.asset(ImageAssets.randomImage),
        ),
        const CustomCloseButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeadline(),
        SizedBox(height: 25.h),
        _buildMyPersonalVideo(),
      ],
    );
  }
}
