import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import 'package:merchant_extras/core/widgets/default_button.dart';

class MessageView extends StatelessWidget {
  const MessageView(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImage(),
          _buildTitle(),
          10.heightSpace(),
          _buildDescription(),
        ],
      ),
      bottomNavigationBar: _buildButton(context),
    );
  }

  _buildImage() {
    return Image.asset(
      image,
      width: 319.w,
      height: 324.w,
    );
  }

  _buildTitle() {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: getBoldStyle(color: ColorManager.black, fontSize: 30.sp),
    );
  }

  _buildDescription() {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 15.sp),
    );
  }

  _buildButton(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: DefaultButton(
              text: AppStrings.back, onTap: () => Navigator.pop(context)),
        ),
        42.heightSpace(),
      ],
    );
  }
}
