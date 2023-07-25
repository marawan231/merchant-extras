import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class DeleteContainer extends StatelessWidget {
  const DeleteContainer(
      {super.key, this.width, this.height, required this.title});

  final double? width;
  final double? height;
  final String title;
  _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(
          Icons.close,
          color: ColorManager.white,
          size: 15.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 229.h,
      height: height ?? 49.h,
      // color: ColorManager.error,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 221.w,
              height: 41.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                color: ColorManager.lightWhite,
              ),
              child: Center(
                child: Text(
                  title,
                  style: getRegularStyle(
                      color: ColorManager.black, fontSize: 17.sp),
                ),
              ),
            ),
          ),
          _buildCloseButton(context),
        ],
      ),
    );
  }
}
