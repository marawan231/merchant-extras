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
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorManager.grey.withOpacity(.10),
            borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: index == 0
                ? Icon(
                    Icons.wallet,
                    color: payMethodDefaultIndex == index
                        ? Theme.of(context).primaryColor
                        : ColorManager.grey,
                  )
                : leading));
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
                  size: 10.sp,
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
      height: 82.h,
      width: double.infinity,
      child: ListTile(
        // selectedTileColor: ColorManager.grey,
        selected: payMethodDefaultIndex == index ? true : false,
        onTap: onTap,
        contentPadding: EdgeInsets.only(top: 15.h, right: 15.w, left: 30.w),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: payMethodDefaultIndex == index
                  ? Theme.of(context).primaryColor
                  : ColorManager.cfGrey,
              width: 1.sp,
            )),
        leading: _buildLeading(context),
        title: _buildTitle(context),
        trailing: _buildTrailing(context),
      ),
    );
  }
}
