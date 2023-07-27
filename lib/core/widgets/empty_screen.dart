import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';
import '../resources/utils.dart';

class EmptyScreen extends StatelessWidget {
  final String? message;
  final double height;
  final String? image;

  const EmptyScreen({Key? key, this.message, this.height = 250, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('ad');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: image == null
              ? Image.asset(ImageAssets.noData, height: height)
              : image!.endsWith('.svg')
                  ? SvgPicture.asset(image!, height: height)
                  : Image.asset(image!, height: height),
        ),
        20.heightSpace(),
        Text(message ?? AppStrings.noData,
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey)),
      ],
    );
  }
}
