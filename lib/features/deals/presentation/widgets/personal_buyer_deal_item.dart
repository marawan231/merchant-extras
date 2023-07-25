import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/model/deal_model.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class PersonalBuyerDealItem extends StatelessWidget {
  const PersonalBuyerDealItem({super.key, required this.model});

  final DealModel model;

  _buildResultContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.dealDetailsViewRoute,
            arguments: {"deal": model});
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: ColorManager.lightWhite,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemImage(context),
              17.widthSpace(),
              _buildResultItemDetails(),
              _buildStatus(),
            ],
          )),
    );
  }

  _buildItemImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30.r)),
      child: Container(
        width: 60.w,
        height: 60.w,
        color: ColorManager.transparent,
        child: CustomNetworkCachedImage(
          url: model.images![0].attachmentUrl!,
        ),
      ),
    );
  }

  _buildResultItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOrderNo(),
        SizedBox(height: 6.h),
        _buildSearchItemTitle(),
        SizedBox(height: 11.h),
        _buildQuantityAndAddress(),
      ],
    );
  }

  _buildSearchItemTitle() {
    return Text(
      model.name ?? '',
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildOrderNo() {
    return Text(
      '${AppStrings.orderNumber} ${model.id}',
      style: getRegularStyle(color: ColorManager.black, fontSize: 11.sp),
    );
  }

  _buildQuantityAndAddress() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildKiloIcon(),
        SizedBox(width: 8.w),
        _buildTotalAmount(),
        SizedBox(width: 10.w),

        _buildPriceTagIcon(),
        SizedBox(width: 8.w),
        _buildPriceForUnit(),
        // _buildLocationIcon(),
        // SizedBox(width: 8.w),
        // _buildLocationValue(),
      ],
    );
  }

  _buildKiloIcon() {
    return Image.asset(
      ImageAssets.weight,
      color: ColorManager.primary,
      width: 10.w,
      height: 10.h,
    );
  }

  _buildTotalAmount() {
    return Text(
      '${model.amount} ${AppStrings.kilo}',
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  _buildPriceTagIcon() {
    return Image.asset(
      ImageAssets.priceTag,
      width: 10.w,
      height: 10.h,
    );
  }

  _buildPriceForUnit() {
    return Text(
      '${model.price}${'\$'} ${AppStrings.priceForUnit}',
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    );
  }

  // _buildLocationIcon() {
  //   return Image.asset(
  //     ImageAssets.priceTag,
  //     width: 10.w,
  //     height: 10.h,
  //   );
  // }

  // _buildLocationValue() {
  //   return Text(
  //     AppStrings.kewit,
  //     style: getRegularStyle(color: ColorManager.grey, fontSize: 10.sp),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return _buildResultContainer(context);
  }

  _buildStatus() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            getTitle(model.status ?? ''),
            style: getRegularStyle(
                color: model.status == 'active'
                    ? ColorManager.active
                    : ColorManager.primary,
                fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
