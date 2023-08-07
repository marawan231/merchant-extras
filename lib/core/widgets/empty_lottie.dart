import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class EmptyLottie extends StatelessWidget {
  const EmptyLottie({Key? key, this.message, this.height = 300, this.icon})
      : super(key: key);
  final String? message;
  final double height;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            icon ?? ImageAssets.walletAnimation,
            // fit: BoxFit.cover,
            height: height,
          ),
        ),
        SizedBox(height: 20.h),
        Text(message ?? AppStrings.thereIsNoDataCurrently,
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey)),
      ],
    );
  }
}
