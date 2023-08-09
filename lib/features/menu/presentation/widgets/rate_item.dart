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
  const RateItem({super.key, required this.index, this.isDealRate});

  final int index;
  final bool? isDealRate;

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
    return Text(
        widget.isDealRate ?? false
            ? rateTitlesInProductRate[widget.index]
            : rateTitles[widget.index],
        style: getRegularStyle(
          color: ColorManager.black,
          fontSize: 15.sp,
        ));
  }

  _buildRateNumber() {
    return Text(
      rateNumber.toString(),
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 18.sp),
    );
  }

  _buildRatingBar() {
    return RatingBar(
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
        full: Icon(
          Icons.star_rounded,
          color: ColorManager.amber,
          size: 35.sp,
        ),
        half: Icon(
          Icons.star_rounded,
          color: ColorManager.amber,
          size: 35.sp,
        ),
        empty: Icon(
          Icons.star_rounded,
          color: ColorManager.lightGrey3,
          size: 35.sp,
        ),
      ),
      onRatingUpdate: (rating) {
        setState(() {
          rateNumber = rating;
          setRatings(rating);
        });
      },
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
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 14.h, bottom: 19.h),
      decoration: BoxDecoration(
        color: ColorManager.lightWhite,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(height: 17.h),
          _buildRatingBar(),
        ],
      ),
    );
  }
}
