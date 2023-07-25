import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/menu/presentation/widgets/rating_bar.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';

class RatingStars extends StatefulWidget {
  const RatingStars({super.key, this.initialRating});
  final double? initialRating;

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  _buildRatingBar() {
    return RatingBar(
      wrapAlignment: WrapAlignment.start,
      initialRating: widget.initialRating ?? 1,
      itemSize: 18.sp,
      minRating: 1,
      updateOnDrag: true,
      // unratedColor: ColorManager.transparent,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.only(left: 6.w),
      ratingWidget: RatingWidget(
        full: Container(
          width: 2.w,
          height: 18.h,
          decoration: BoxDecoration(
              color: ColorManager.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Icon(
            Icons.star,
            color: ColorManager.amber,
            // size: 12.sp,
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
          width: 2.w,
          height: 18.h,
          decoration: BoxDecoration(
              color: ColorManager.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Icon(
            Icons.star,
            color: ColorManager.unSelectedStar,
            // size: 12.sp,
          ),
        ),
      ),
      onRatingUpdate: (rating) {
        setState(() {
          rateNumber = rating;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRatingBar();
  }
}
