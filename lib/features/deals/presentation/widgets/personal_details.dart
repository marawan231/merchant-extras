import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_button.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});
  _buildPersonalDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(),
          SizedBox(width: 15.w),
          _buildNameAndJop(),
          const Spacer(),
          const EditButton()
        ],
      ),
    );
  }

  _buildAvatar() {
    return Image.asset(
      ImageAssets.avatar,
      width: 65.w,
      height: 60.h,
    );
  }

  _buildNameAndJop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        SizedBox(height: 13.h),
        _buildJop(),
      ],
    );
  }

  _buildName() {
    return Text(
      AppStrings.username,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildJop() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.user,
          width: 12.w,
          height: 12.h,
        ),
        SizedBox(width: 8.w),
        _buildJopTitle(),
        SizedBox(width: 10.w),
        _buildStars(),
      ],
    );
  }

  _buildJopTitle() {
    return Text(
      AppStrings.seller,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  _buildStars() {
    return Image.asset(
      ImageAssets.stars,
      width: 85.w,
      height: 13.h,
    );
  }

  _buildDescription() {
    return Text(
      AppStrings.randomText,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 13.sp),
    );
  }

  _buildVideoDemo() {
    return Image.asset(
      ImageAssets.videoDemo,
      width: 295.w,
      height: 130.h,
    );
  }

  _buildMyCertificates(BuildContext context) {
    return Column(
      children: [
        _buildHeadline(),
        SizedBox(height: 17.w),
        _buildCertificatesList(),
      ],
    );
  }

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
    return Image.asset(ImageAssets.diploma);
  }

  _buildText() {
    return Text(
      AppStrings.myDiplomas,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  _buildCertificatesList() {
    return SizedBox(
      height: 70.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Image.asset(ImageAssets.certificate);
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 5.w);
          },
          itemCount: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: ColorManager.lightWhite,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Column(
              children: [
                _buildPersonalDetails(context),
                SizedBox(height: 15.h),
                _buildDescription(),
                SizedBox(height: 15.h),
                _buildVideoDemo(),
                SizedBox(height: 31.h),
                _buildMyCertificates(context),
              ],
            ),
          ),
          // _buildAddCertificateButton(context),
        ],
      ),
    );
  }
}
