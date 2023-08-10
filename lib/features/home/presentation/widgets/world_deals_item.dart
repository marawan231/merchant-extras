import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/resources/color_manager.dart';

import '../../../deals/data/model/deal_model.dart';

class WorldDealsItem extends StatelessWidget {
  const WorldDealsItem({super.key, required this.deals, required this.index});

  final List<DealModel> deals;
  final int index;

  _buildDetails() {
    // DateTime dateTime = DateTime.parse(deals[index].createdAt!);
    // String formattedDateTime = DateFormat('MM/dd/yyyy').format(dateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ClockDate(
        //   color: ColorManager.grey,
        //   date: formattedDateTime,
        // ),
        // SizedBox(height: 2.h),
        Text(
          deals[index].name!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: getMediumStyle(fontSize: 12.sp, color: ColorManager.boldGrey),
        )
      ],
    );
  }

  _buildItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImage(),
        8.verticalSpace,
        Padding(
          padding: EdgeInsetsDirectional.only(start: 11.w, end: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetails(),
              8.verticalSpace,
              _buildPrice(),
              // 4.verticalSpace,
            ],
          ),
        )
        // _buildButton(context, 10.h),
      ],
    );
  }

  _buildPrice() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${deals[index].price!} ${'\$'}',
          style: getMediumStyle(fontSize: 12.sp, color: ColorManager.primary),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 20.w),
          child: Text(
            '${AppStrings.theQuantity} : ${deals[index].amount!}',
            style:
                getLightStyle(fontSize: 12.sp, color: ColorManager.lightGrey2),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    log('${deals.length} ${deals[index].images![0].attachmentUrl!}');
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: CustomNetworkCachedImage(
        height: 129.h,
        width: 138.w,
        url: deals[index].images![0].attachmentUrl!,
        fit: BoxFit.cover,
        // filter: ColorFilter.mode(
        //     ColorManager.black.withOpacity(.45), BlendMode.darken),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.searchResultDealItemDetails, arguments: {
          'deal': deals[index],
        });
      },
      child: Container(
        width: 125.w,
        // padding: EdgeInsets.only(bottom: 10.h, right: 8.w, left: 6.w),
        decoration: BoxDecoration(
          color: ColorManager.backGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: _buildItem(),
      ),
    );
  }
}
