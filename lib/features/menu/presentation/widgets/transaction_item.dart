import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

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
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: Center(
        child: Icon(
          Icons.account_balance_wallet,
          color: ColorManager.white,
          size: 14.sp,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type,
          style: getBoldStyle(color: ColorManager.black, fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        ClockDate(
          color: ColorManager.grey,
          date: date,
        )
      ],
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
    return ListTile(
      contentPadding:
          EdgeInsets.only(top: 22.h, right: 15.w, left: 20.w, bottom: 20.h),
      dense: true,
      horizontalTitleGap: 20.w,
      tileColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        side:
            BorderSide(color: ColorManager.cfGrey.withOpacity(.5), width: 1.sp),
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      leading: _buildLeading(context),
      title: _buildTitle(),
      trailing: _buildTrailing(context),
    );
  }
}
