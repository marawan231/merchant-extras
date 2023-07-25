import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/headline.dart';
import 'owner_info.dart';

class OwnerMainDetails extends StatelessWidget {
  const OwnerMainDetails({super.key});

  _buildOwnerMainDetails() {
    return Container(
      height: 465.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Column(
        // padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),

        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DealOwnerInfo(),
          SizedBox(height: 10.h),
          _buildDescription(),
          SizedBox(height: 15.h),
          _buildDemoVideo(),
          SizedBox(height: 31.h),
          _buildCertificate(),

          // MyCertificates(),
        ],
      ),
    );
  }

  _buildDescription() {
    return Text(
      AppStrings.randomText,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 13.sp),
    );
  }

  _buildDemoVideo() {
    return Image.asset(
      ImageAssets.videoDemo,
      width: double.infinity,
      height: 130.h,
      fit: BoxFit.fill,
    );
  }

  _buildCertificate() {
    return Column(
      children: [
        const Headline(title: AppStrings.myDiplomas, icon: ImageAssets.diploma),
        SizedBox(
          width: double.infinity,
          height: 107.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Image.asset(ImageAssets.certificate,
                    width: 107.w, height: 70.h);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: 10),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildOwnerMainDetails();
  }
}
