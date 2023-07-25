import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/clock_time.dart';
import '../../../../core/widgets/default_back_arrow.dart';
import '../../../../core/widgets/online_circle.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ChatsItem extends StatelessWidget {
  const ChatsItem({
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

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMiniTitle(),
        _buildMainTitle(),
      ],
    );
  }

  _buildMiniTitle() {
    return ClockTime(color: ColorManager.grey);
  }

  Widget _buildMainTitle() {
    return Text(
      title,
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildSubtitle() {
    return Text(
      AppStrings.chatInitialMessage,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  Widget _buildTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const OnlineCircle(),
        SizedBox(width: 10.w),
        const DefaultBackArrow(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      width: double.infinity,
      child: ListTile(
        selected: defaultIndex == index ? true : false,
        onTap: onTap,
        contentPadding: EdgeInsets.only(top: 19.h, left: 20.w, right: 20.w),
        horizontalTitleGap: 15.w,
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
        title: _buildTitle(),
        subtitle: _buildSubtitle(),
        trailing: _buildTrailing(),
      ),
    );
  }
}
