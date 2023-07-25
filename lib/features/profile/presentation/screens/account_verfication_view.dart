import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';

class AccountVerficationView extends StatelessWidget {
  const AccountVerficationView({super.key});

  _buildBody(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 52.h, bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline(context),
          SizedBox(height: 15.h),
          _buildAddImageContainer(context),
          SizedBox(height: 25.h),
          _buildImage(context),
          SizedBox(height: 12.h),
          _buildImageTitle(),
          const Spacer(),
          DefaultButton(
            text: AppStrings.send,
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, Routes.accountVerifySuccessViewRoute);
            },
          ),
        ],
      ),
    );
  }

  _buildImageTitle() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Text(
        'card title',
        style: getRegularStyle(color: ColorManager.grey, fontSize: 14.sp),
      ),
    );
  }

  _buildImage(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageAssets.certificate),
        Positioned(
          top: 28.h,
          right: 53.w,
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorManager.white),
            child: Icon(
              Icons.close,
              color: Theme.of(context).primaryColor,
              size: 16.sp,
            ),
          ),
        ),
      ],
    );
  }

  _buildAddImageContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49.h,
      decoration: BoxDecoration(
          color: ColorManager.grey.withOpacity(.10),
          borderRadius: BorderRadius.circular(5.r)),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 25.w),
        child: Row(
          children: [
            Text(
              AppStrings.identityImage,
              style: getRegularStyle(color: ColorManager.grey, fontSize: 17.sp),
            ),
            const Spacer(),
            Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  _buildHeadline(BuildContext context) {
    return Row(
      children: [
        _buildIcon(context),
        SizedBox(width: 10.w),
        _buildTitle(),
      ],
    );
  }

  _buildIcon(BuildContext context) {
    return Icon(
      Icons.credit_card,
      color: Theme.of(context).primaryColor,
      size: 16.sp,
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.putYourIdentity,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.accountVerficaion),
      ),
      body: _buildBody(context),
    );
  }
}
