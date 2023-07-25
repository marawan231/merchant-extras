import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';

class MainSearchViewItem extends StatelessWidget {
  const MainSearchViewItem({
    super.key,
    required this.leading,
    required this.title,
    required this.index,
    this.onTap,
    required this.onArrowTap,
  });

  final IconData leading;
  final String title;
  final int index;
  final void Function()? onTap;
  final void Function()? onArrowTap;

  Widget _buildLeading(BuildContext context) {
    return Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
            color: ColorManager.grey.withOpacity(.10),
            borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: Icon(
              leading,
              color: maiSearchListDefaultIndex == index
                  ? Theme.of(context).primaryColor
                  : ColorManager.grey,
            )));
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: getBoldStyle(
          color: maiSearchListDefaultIndex == index
              ? Theme.of(context).primaryColor
              : ColorManager.grey,
          fontSize: 18.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return InkWell(
      onTap: onArrowTap,
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 20.sp,
        color: maiSearchListDefaultIndex == index
            ? Theme.of(context).primaryColor
            : ColorManager.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: ListTile(
        // selectedTileColor: ColorManager.grey,
        selected: maiSearchListDefaultIndex == index ? true : false,
        onTap: onTap,
        contentPadding: EdgeInsets.only(top: 15.h, right: 15.w, left: 30.w),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: maiSearchListDefaultIndex == index
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
