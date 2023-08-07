import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';

class PayMethodItem extends StatelessWidget {
  const PayMethodItem({
    super.key,
    required this.leading,
    required this.title,
    required this.index,
    this.onTap,
    required this.onArrowTap,
  });

  final Widget leading;
  final String title;
  final int index;
  final void Function()? onTap;
  final void Function()? onArrowTap;

  Widget _buildLeading(BuildContext context) {
    return Container(
        // width: 40.w,
        // height: 40.h,
        decoration: BoxDecoration(
            // color: ColorManager.red,
            borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: SizedBox(width: 19.w, height: 19.h, child: leading),
        ));
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: getBoldStyle(
          color: payMethodDefaultIndex == index
              ? Theme.of(context).primaryColor
              : ColorManager.grey,
          fontSize: 18.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return InkWell(
        onTap: onArrowTap,
        child: payMethodDefaultIndex == index
            ? Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: ColorManager.white,
                  size: 15.sp,
                ),
              )
            : Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.cfGrey),
                  shape: BoxShape.circle,
                  color: ColorManager.transparent,
                ),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 54.h,
      width: double.infinity,
      child: ListTile(
        
        horizontalTitleGap: 0,
        // selectedTileColor: ColorManager.grey,
        selected: payMethodDefaultIndex == index ? true : false,
        onTap: onTap,
        contentPadding:
            EdgeInsets.only(top: 4.h, bottom: 4.h, right: 23.w, left: 23.w),
        dense: true,
        // horizontalTitleGap: 20.w,
        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide(
              color: payMethodDefaultIndex == index
                  ? Theme.of(context).primaryColor
                  : ColorManager.cfGrey,
              width: 2.sp,
            )),
        leading: _buildLeading(context),
        title: _buildTitle(context),
        trailing: _buildTrailing(context),
      ),
    );
  }
}
