import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../business_logic/cubit/menu_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'rating_bar.dart';

class RateItem extends StatefulWidget {
  const RateItem({super.key, required this.index});
  final int index;

  @override
  State<RateItem> createState() => _RateItemState();
}

class _RateItemState extends State<RateItem> {
  double rateNumber = 1.0;
  // late MenuCubit _menuCubit;
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MenuCubit>(context) = BlocProvider.of<MenuCubit>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // BlocProvider.of<MenuCubit>(context) = BlocProvider.of<MenuCubit>(context);
  }

  _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeadline(context),
        _buildRateNumber(),
      ],
    );
  }

  _buildHeadline(BuildContext context) {
    return Text(rateTitles[widget.index],
        style: Theme.of(context).textTheme.headlineSmall);
  }

  _buildRateNumber() {
    return Text(
      rateNumber.toString(),
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 22.sp),
    );
  }

  _buildRatingBar() {
    return Expanded(
      child: RatingBar(
        initialRating: 1,
        itemSize: 49.sp,
        minRating: 1,
        updateOnDrag: true,
        unratedColor: ColorManager.white,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: EdgeInsets.only(left: 9.w),
        ratingWidget: RatingWidget(
          full: Container(
            width: 49.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Icon(
              Icons.star,
              color: ColorManager.amber,
              size: 35.sp,
            ),
          ),
          half: Container(
            width: 49.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Icon(
              Icons.star,
              color: ColorManager.amber,
              size: 35.sp,
            ),
          ),
          empty: Container(
            width: 49.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Icon(
              Icons.star,
              color: ColorManager.unSelectedStar,
              size: 35.sp,
            ),
          ),
        ),
        onRatingUpdate: (rating) {
          setState(() {
            rateNumber = rating;
            setRatings(rating);
          });
        },
      ),
    );
  }

  void setRatings(double rating) {
    switch (widget.index) {
      case 0:
        BlocProvider.of<MenuCubit>(context).easyToUseRateing =
            rating.round().toString();
        log(BlocProvider.of<MenuCubit>(context).easyToUseRateing);
        break;
      case 1:
        BlocProvider.of<MenuCubit>(context).responsiveRateing =
            rating.round().toString();
        log(BlocProvider.of<MenuCubit>(context).responsiveRateing);

        break;

      case 2:
        BlocProvider.of<MenuCubit>(context).supportRateing =
            rating.round().toString();
        log(BlocProvider.of<MenuCubit>(context).supportRateing);
        break;
      case 3:
        BlocProvider.of<MenuCubit>(context).updatesRateing =
            rating.round().toString();
        log(BlocProvider.of<MenuCubit>(context).updatesRateing);
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 144.h,
      decoration: BoxDecoration(
        color: ColorManager.lightWhite,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 20.h),
            _buildRatingBar(),
          ],
        ),
      ),
    );
  }
}
