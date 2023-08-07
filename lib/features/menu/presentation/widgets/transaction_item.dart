import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/assets_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class TransactionItem extends StatelessWidget {
  final String amount;
  final String date;
  final String type;

  const TransactionItem({
    super.key,
    required this.amount,
    required this.date,
    required this.type,

    // this.onTap,
  });

  // final void Function()? onTap;

  Widget _buildLeading(BuildContext context) {
    return Container(
      height: 54.h,
      width: 54.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Center(
        child: Image.asset(
          ImageAssets.wallet,
          color: ColorManager.primary,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: getBoldStyle(color: ColorManager.black, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          ClockDate(
            color: ColorManager.grey,
            date: date,
          )
        ],
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: getBoldStyle(
                  color: Theme.of(context).primaryColor, fontSize: 25.sp),
              text: amount,
            ),
            // WidgetSpan(child: SizedBox(width: 6.w)),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h, right: 6.w),
                child: Text(
                  '\$',
                  style: getRegularStyle(
                      color: Theme.of(context).primaryColor, fontSize: 17.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(top: 22.h, right: 15.w, left: 20.w, bottom: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(
                color: ColorManager.borderInInputTextFiefld, width: 1.w)),
        child: Row(
          children: [
            _buildLeading(context),
            SizedBox(width: 20.w),
            _buildTitle(),
            _buildTrailing(context),
          ],
        ));
  }
}
