import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

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
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: getBoldStyle(color: ColorManager.grey, fontSize: 15.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new,
      size: 20.sp,
      color: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 75.h,
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
        tileColor: tileColor ?? ColorManager.lightWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: ColorManager.cfGrey,
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
