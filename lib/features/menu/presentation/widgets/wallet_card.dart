import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'charge_wallet_button.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.totalBalance, required this.date});

  final String totalBalance;
  final String date;
  _buildMainInfo() {
    return Padding(
      padding: EdgeInsets.only(right: 30.w, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline(),
          _buildBalance(),
          SizedBox(height: 8.h),
          _buildDate(),
        ],
      ),
    );
  }

  _buildHeadline() {
    return Text(
      AppStrings.currentBalance,
      style: getRegularStyle(color: ColorManager.white, fontSize: 14.sp),
    );
  }

  _buildBalance() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '\$',
            style: getRegularStyle(color: ColorManager.white, fontSize: 15.sp)),
        WidgetSpan(child: SizedBox(width: 5.w)),
        TextSpan(
            text: totalBalance,
            style: getBoldStyle(color: ColorManager.white, fontSize: 40.sp)),
        TextSpan(
            text: '.00',
            style: getBoldStyle(color: ColorManager.white, fontSize: 20.sp)),
      ])),
    );
  }

  _buildDate() {
    return ClockDate(
      color: ColorManager.white,
      date: date,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Stack(
        children: [
          _buildMainInfo(),
          const ChargeWalletButton(),
        ],
      ),
    );
  }
}
