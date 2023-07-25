import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import '../../data/model/deal_model.dart';

class DealDetailsCard extends StatelessWidget {
  const DealDetailsCard({super.key, required this.deal});
  final DealModel deal;
  _buildDealStatus() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 17.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          getTitle(deal.status ?? 'active'),
          style: getRegularStyle(color: ColorManager.white, fontSize: 14.sp),
        ),
      ),
    );
  }

  _buildDealNumber() {
    return Text(
      deal.id.toString(),
      style: getRegularStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildDealTitle() {
    return Text(
      deal.name ?? '',
      style: getBoldStyle(color: ColorManager.white, fontSize: 24.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 161.h,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Stack(
        children: [
          _buildDealStatus(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDealNumber(),
                _buildDealTitle(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h, right: 20.w),
            child: Align(
                alignment: Alignment.bottomRight,
                child: ClockDate(
                  color: ColorManager.white,
                  date: convertDateFormat(deal.createdAt!),
                )),
          ),
        ],
      ),
    );
  }
}
