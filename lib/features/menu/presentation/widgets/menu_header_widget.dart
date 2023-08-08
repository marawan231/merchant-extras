import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/assets_manager.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/constants.dart';
import 'package:merchant_extras/core/resources/route_manager.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import 'package:merchant_extras/core/widgets/custom_network_image.dart';

class MenuHeaderWidget extends StatelessWidget {
  const MenuHeaderWidget({super.key, this.avatar});

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(context),
        20.widthSpace(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserName(),
              4.heightSpace(),
              _buildPhoneText(),
              4.heightSpace(),
              _buildEditBtn(context),
            ],
          ),
        ),
      ],
    );
  }

  _buildAvatar(context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.editProfileRoute),
        child: Container(
            clipBehavior: Clip.hardEdge,
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: ColorManager.grey,
            ),
            child: CustomNetworkCachedImage(url: avatar)));
  }

  _buildPhoneText() {
    return Text(
      userPhone,
      style: getRegularStyle(fontSize: 15.sp, color: ColorManager.darkGrey),
    );
  }

  Widget _buildUserName() {
    return Text(
      userName ?? AppStrings.username,
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.black),
    );
  }

  Widget _buildEditBtn(context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.editProfileRoute),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          AppStrings.editAccount,
          style: getRegularStyle(fontSize: 15.sp, color: ColorManager.white),
        ),
      ),
    );
  }
}
