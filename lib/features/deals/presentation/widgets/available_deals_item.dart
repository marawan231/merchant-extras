import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_back_arrow.dart';

class AvailableDealsItem extends StatelessWidget {
  const AvailableDealsItem({
    super.key,
    required this.leading,
    required this.title,
    required this.index,
    this.onTap,
  });

  final String leading;
  final String title;
  final int index;
  final void Function()? onTap;

  Widget _buildLeading() {
    return Image.asset(
      leading,
      width: 65.w,
      height: 65.h,
    );
  }

  Widget _buildMainTitle() {
    return Text(
      title,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildSubtitle() {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Image.asset(
              ImageAssets.weight,
              width: 10.w,
              height: 10.h,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            '${AppStrings.thousand} ${AppStrings.kilo}',
            style:
                getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
          ),
          SizedBox(width: 9.w),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Image.asset(
              ImageAssets.priceTag,
              width: 10.w,
              height: 10.h,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            '1\$',
            style:
                getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildTrailing() {
    return const DefaultBackArrow();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: double.infinity,
      child: ListTile(
        // selectedTileColor: ColorManager.grey,
        selected: defaultIndex == index ? true : false,
        onTap: onTap,
        contentPadding: EdgeInsets.only(top: 8.h, left: 20.w, right: 20.w),
        // dense: true,
        horizontalTitleGap: 15.w,
        // isThreeLine: true,

        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: defaultIndex == index
                  ? Theme.of(context).primaryColor
                  : ColorManager.cfGrey,
              width: 1.sp,
            )),
        leading: _buildLeading(),
        title: _buildMainTitle(),
        subtitle: _buildSubtitle(),
        trailing: _buildTrailing(),
      ),
    );
  }
}
