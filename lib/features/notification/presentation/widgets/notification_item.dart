import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:merchant_extras/features/notification/data/models/notification_model.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'clock_date.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.model});

  final NotifiticationModel? model;

  _buildLeading(BuildContext context) {
    return Container(
      // alignment: Alignment.,
      width: 55.w,
      height: 55.w,
      decoration: const BoxDecoration(
        // color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          ImageAssets.bell,
          color: ColorManager.primary,
          height: 22.w,
          width: 22.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildTitle() {
    String formattedDate =
        DateFormat.yMd().format(model?.createdAt ?? DateTime.now());
    return ClockDate(
      color: ColorManager.grey,
      date: formattedDate,
    );
  }

  _buildSubTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        model?.content ?? '',
        style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorManager.cfGrey)),
      ),
      child: ListTile(
        tileColor:
            model?.isRead == 1 ? ColorManager.white : ColorManager.lightWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        contentPadding:
            EdgeInsets.only(top: 15.h, right: 20.w, left: 31.w, bottom: 15.h),
        dense: true,
        leading: _buildLeading(context),
        title: _buildSubTitle(),
        subtitle: _buildTitle(),
      ),
    );
  }
}
