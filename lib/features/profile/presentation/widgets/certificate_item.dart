import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'close_button.dart';

class CertificateItem extends StatelessWidget {
  const CertificateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136.w,
      height: 85.h,
      child: Stack(
        children: [
          Image.asset(ImageAssets.certificate),
          const CustomCloseButton(),
        ],
      ),
    );
  }
}
