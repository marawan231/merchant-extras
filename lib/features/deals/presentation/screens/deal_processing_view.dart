import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';

import '../../../../core/widgets/approve_text_button.dart';

class DealProcessingView extends StatelessWidget {
  const DealProcessingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 235.h, left: 72.w),
        child: Column(
          children: [
            Image.asset(
              ImageAssets.dealProcessing,
              width: 232.w,
              height: 302.h,
            ),
            SizedBox(height: 82.h),
            const ApproveTextButton(),
          ],
        ),
      ),
    );
  }
}
