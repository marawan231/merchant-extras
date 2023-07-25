import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.text,
      this.widht,
      this.onTap,
      this.color,
      this.isLoading});

  final String text;
  final double? widht;
  final Color? color;
  final void Function()? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: widht ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Center(
          child: isLoading == true
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 1.5.w))
              : Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
        ),
      ),
    );
  }
}
