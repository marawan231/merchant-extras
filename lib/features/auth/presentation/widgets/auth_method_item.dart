import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/utils.dart';

class AuthMethodItem extends StatelessWidget {
  const AuthMethodItem({
    super.key,
    required this.leading,
    required this.title,
    this.height,
    this.tileColor,
    required this.index,
  });

  final String leading;
  final String title;
  final double? height;
  final Color? tileColor;
  final int index;
  // final void Function()? onTap;

  Widget _buildLeading() {
    return Image.asset(
      leading,
      width: 25.w,
      height: 25.h,
      color: index == 1
          ? ColorManager.primary
          : index == 0
              ? ColorManager.white
              : null,
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        title,
        style: getBoldStyle(
            color: (index == 0
                ? Colors.white
                : index == 1
                    ? ColorManager.primary
                    : ColorManager.darkGrey),
            fontSize: 15.sp),
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new,
      size: 20.sp,
      color: index == 1
          ? ColorManager.primary
          : index == 0
              ? ColorManager.white
              : ColorManager.darkGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 54.w,
      child: ListTile(
        horizontalTitleGap: 0,
        // contentPadding: EdgeInsets.only(right: 20.w, bottom: 30.w),
        tileColor: tileColor ??
            (index == 0
                ? ColorManager.primary
                : index == 1
                    ? ColorManager.transparent
                    : ColorManager.lightWhite),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide(
              color: index != 2
                  ? ColorManager.primary
                  : ColorManager.cfGrey.withOpacity(.6),
              width: 1.sp,
            )),
        leading: _buildLeading(),
        title: _buildTitle(),
        trailing: _buildTrailing(context),
        onTap: () {
          // onTap?.call();
          getRoute(index, context);
        },
      ),
    );
  }
}
