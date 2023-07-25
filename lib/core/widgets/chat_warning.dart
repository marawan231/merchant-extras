import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

class ChatWarning extends StatelessWidget {
  const ChatWarning({super.key});

  _buildChatWarning(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 33.w, left: 33.w),
      child: Container(
        width: double.infinity,
        height: 86.h,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.03)),
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: ColorManager.error,
                  size: 12.sp,
                ),
              ),
              SizedBox(width: 8.w),
              SizedBox(
                width: 259.w,
                height: 56.h,
                child: Text(
                  AppStrings.chatWarning,
                  // maxLines: 3,
                  textAlign: TextAlign.center,

                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChatWarning(context);
  }
}
