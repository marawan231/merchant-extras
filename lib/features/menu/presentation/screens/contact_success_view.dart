import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ContactSuccessView extends StatelessWidget {
  const ContactSuccessView({super.key});
  _buildLogo() {
    return Image.asset(
      ImageAssets.contactSuccess,
      width: 232.w,
      height: 302.h,
    );
  }

  _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        AppStrings.approve,
        style:
            getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 17.sp)
                .copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(),
            SizedBox(height: 25.h),
            _buildButton(context),
          ],
        ),
      ),
    );
  }
}
