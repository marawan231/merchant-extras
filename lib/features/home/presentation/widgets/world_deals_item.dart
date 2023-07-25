import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/resources/color_manager.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../deals/data/model/deal_model.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class WorldDealsItem extends StatelessWidget {
  const WorldDealsItem({super.key, required this.deals, required this.index});

  final List<DealModel> deals;
  final int index;

  _buildImage(double height) {
    return SizedBox(
      height: height,
      child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorManager.transparent,
                  ColorManager.black.withOpacity(.7),
                ]).createShader(bounds);
          },
          blendMode: BlendMode.multiply,
          child: CustomNetworkCachedImage(
            url: deals[index].images![0].attachmentUrl!,
            fit: BoxFit.fill,
            filter: ColorFilter.mode(
                ColorManager.black.withOpacity(.2), BlendMode.darken),
          )),
    );
  }

  /*
  Image.asset(
      ImageAssets.cherry,
      height: 100.h,
      width: 193.w,
      fit: BoxFit.fill,
      colorBlendMode: BlendMode.darken,
      color: ColorManager.black.withOpacity(.2),
    );
   */

  _buildDetails(BuildContext context, double height) {
    DateTime dateTime = DateTime.parse(deals[index].createdAt!);
    String formattedDateTime = DateFormat('MM/dd/yyyy').format(dateTime);

    return Padding(
      padding: EdgeInsets.only(top: height, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClockDate(
            color: ColorManager.grey,
            date: formattedDateTime,
          ),
          SizedBox(height: 2.h),
          Text(
            deals[index].name!,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }

  _buildButton(BuildContext context, double height) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: height),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.searchResultDealItemDetails,
                arguments: {
                  'deal': deals[index],
                });
          },
          child: CircleAvatar(
            backgroundColor: ColorManager.white,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColor,
              size: 12.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxHeight,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: ColorManager.grey.withOpacity(.10)),
        child: Stack(
          children: [
            _buildImage(constraints.maxHeight * 0.55),
            _buildDetails(context, constraints.maxHeight * 0.65),
            _buildButton(context, constraints.maxHeight * 0.10),
          ],
        ),
      );
    });
  }
}
