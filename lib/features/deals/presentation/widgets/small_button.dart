import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
      required this.color,
      required this.textColor,
      required this.title,
      required this.onTap});
  final Color? color;
  final Color textColor;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Center(
            child: Text(
          title,
          style: getRegularStyle(color: textColor, fontSize: 17.sp),
        )),
      ),
    );
  }
}
