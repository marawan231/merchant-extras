import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'add_button.dart';
import 'certificate_item.dart';

class MyCertificates extends StatelessWidget {
  const MyCertificates({super.key});

  //TODO refactor headline to seperate Widget
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

  _buildCertificates() {
    return Row(
      children: [
        const AddButton(),
        SizedBox(width: 15.w),
       const CertificateItem(),
        SizedBox(width: 8.w),

        const CertificateItem(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeadline(),
        SizedBox(height: 27.h),
        _buildCertificates(),
      ],
    );
  }
}
