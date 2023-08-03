import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../deals/business_logic/cubit/deals_cubit.dart';
import '../../../deals/business_logic/cubit/deals_state.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/default_button.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../deals/data/model/deal_model.dart';
import '../../../deals/presentation/widgets/custom_deal_detail_container.dart.dart';
import '../../../deals/presentation/widgets/small_button.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import '../widgets/search_item_details_image_slider.dart';

// ignore: must_be_immutable
class SearchResultItemDealDetails extends StatefulWidget {
  SearchResultItemDealDetails({super.key, required this.deal});

  DealModel? deal;

  @override
  State<SearchResultItemDealDetails> createState() =>
      _SearchResultItemDealDetailsState();
}

class _SearchResultItemDealDetailsState
    extends State<SearchResultItemDealDetails> {
  @override
  initState() {
    // BlocProvider.of<DealsCubit>(context).getDealDetails(widget.deal.id!);

    super.initState();
  }

  _buildBloc() {
    return BlocConsumer<DealsCubit, DealsState>(
      listener: (context, state) {
        state.whenOrNull(getDealsDetailsSuccedded: (model) {
          widget.deal = model.deal;
          widget.deal?.images = model.images;
        });
      },
      builder: (context, state) {
        return _buildBody(context);
      },
    );
  }

  _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
      children: [
        _buildImageSlider(),
        _buildInfo(context),
      ],
    );
  }

  _buildImageSlider() {
    return SearchItemDetailsImageSlider(
      images: widget.deal?.images ?? [],
    );
  }

  _buildInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 31.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateTime(),
          SizedBox(height: 14.h),
          _buildTitle(),
          SizedBox(height: 16.h),
          _buildSubtitle(context),
          SizedBox(height: 15.h),
          _buildDetailsText(),
          SizedBox(height: 20.h),
          _buildRatingBox(),
          SizedBox(height: 15.h),
          // _buildMyLocation(),
          // SizedBox(height: 15.h),
          Row(
            children: [
              _buildAvailableQuantity(context),
              SizedBox(width: 5.w),
              _buildKiloPrice(context),
            ],
          ),
          SizedBox(height: 15.h),
          _buildRemainingQuantity(context),
          SizedBox(height: 80.h),
          _buildButtons(context),
        ],
      ),
    );
  }

  _buildBuyRemainingQuantityButton(context) {
    return DefaultButton(
      text:
          "${AppStrings.buyRemainingQuantity} (${widget.deal?.buyInformation!.currentAmount} ${AppStrings.kilo})",
      color: ColorManager.black,
      onTap: () {
        Navigator.pushNamed(context, Routes.buySelectedQuantityViewRoute,
            arguments: {
              'unitPrice': widget.deal!.price,
              'quantityFieldVisible': false,
              'total': num.parse(widget.deal!.price!.toString()) *
                  widget.deal!.buyInformation!.currentAmount!,
              'dealId': widget.deal!.id.toString(),
              'quantity': widget.deal!.buyInformation!.currentAmount.toString(),
            });
      },
    );
  }

  _buildButtons(BuildContext context) {
    return Column(
      children: [
        _buildBuyRemainingQuantityButton(context),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: SmallButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.buySelectedQuantityViewRoute,
                      arguments: {
                        'unitPrice': widget.deal!.price,
                        'quantityFieldVisible': false,
                        'total': num.parse(widget.deal!.price!.toString()) *
                            widget.deal!.buyInformation!.currentAmount!,
                        'dealId': widget.deal!.id.toString(),
                        'quantity': widget.deal!.buyInformation!.currentAmount
                            .toString(),
                      });
                },
                title: AppStrings.buyAllQuantity,
                color: Theme.of(context).primaryColor,
                textColor: ColorManager.white,
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: SmallButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.buySelectedQuantityViewRoute,
                      arguments: {
                        'unitPrice': widget.deal!.price,
                        'quantityFieldVisible': true,
                        'total': 0,
                        'dealId': widget.deal!.id.toString(),
                        'quantity': widget.deal!.buyInformation!.currentAmount
                            .toString(),
                      });
                },
                title: AppStrings.buySelectedQuantity,
                color: ColorManager.white,
                textColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvailableQuantity(BuildContext context) {
    return Expanded(
      child: CustomDealDetailContainer(
          height: 79.h,
          title: AppStrings.allQuantity,
          value: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: widget.deal?.buyInformation!.totalAmount.toString(),
                style: getBoldStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20.sp)),
            TextSpan(
                text: ' كيلو',
                style: getBoldStyle(
                    color: Theme.of(context).primaryColor, fontSize: 12.sp))
          ])),
          icon: ImageAssets.weight),
    );
  }

  _buildKiloPrice(BuildContext context) {
    return Expanded(
      child: CustomDealDetailContainer(
        width: 165.w,
        height: 79.h,
        title: AppStrings.availbaleKilosPrice,
        titleTextStyle:
            getBoldStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
        icon: ImageAssets.priceTag,
        value: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: widget.deal?.price.toString(),
              style: getBoldStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20.sp)),
          TextSpan(
              text: '  \$',
              style: getBoldStyle(
                  color: Theme.of(context).primaryColor, fontSize: 12.sp))
        ])),
      ),
    );
  }

  _buildRemainingQuantity(BuildContext context) {
    return CustomDealDetailContainer(
      title: AppStrings.availableQuantity,
      icon: ImageAssets.weight,
      value: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: widget.deal?.buyInformation!.currentAmount.toString(),
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.sp)),
        TextSpan(
            text: ' كيلو',
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 12.sp))
      ])),
    );
  }

  _buildDateTime() {
    return ClockDate(
      color: ColorManager.grey,
      date: widget.deal?.time,
    );
  }

  _buildTitle() {
    return Text(
      widget.deal?.name ?? '',
      style: getBoldStyle(color: ColorManager.black, fontSize: 22.sp),
    );
  }

  _buildSubtitle(BuildContext context) {
    return _buildStatus(context);
  }

  _buildStatus(BuildContext context) {
    return Text(
      widget.deal?.shape ?? '',
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 17.sp),
    );
  }

  // _buildBoxIcon(BuildContext context) {
  //   return Icon(
  //     Icons.local_shipping_rounded,
  //     color: Theme.of(context).primaryColor,
  //     size: 20.sp,
  //   );
  // }

  // _buildStatusValue() {
  //   return Text(
  //     AppStrings.cannotSendSample,
  //     style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 17.sp),
  //   );
  // }

  _buildDetailsText() {
    return Text(
      widget.deal?.description ?? '',
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 13.sp)
          .copyWith(height: 1.5.h),
    );
  }

  _buildRatingBox() {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w, left: 15.w),
        child: Row(
          children: [
            _buildRatingTitle(),
            SizedBox(width: 88.w),
            _buildRatingStars(),
            _buildRateNumber(),
          ],
        ),
      ),
    );
  }

  _buildRatingTitle() {
    return Text(
      AppStrings.productRate,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
    );
  }

  _buildRatingStars() {
    return RatingStars(
      initialRating: calculateRate().round().toDouble(),
    );
  }

  double calculateRate() {
    if (widget.deal!.currentUserRate != null) {
      double total = double.parse(
              widget.deal!.currentUserRate!.professionlStars!.toString()) +
          double.parse(
              widget.deal!.currentUserRate!.communicationStars!.toString()) +
          double.parse(widget.deal!.currentUserRate!.qualityStars!.toString()) +
          double.parse(
              widget.deal!.currentUserRate!.experienceStars!.toString()) +
          double.parse(widget.deal!.currentUserRate!.timeStars!.toString()) +
          double.parse(
              widget.deal!.currentUserRate!.futureDealsStars!.toString());

      double maximumPossibleValue = 6 * 5; // 6 categories with a scale of 5
      double rate = (total / maximumPossibleValue) * 5;
      log(rate.toString());
      // log('rate: $rate');

      return rate;
    } else {
      // log('rate: 0');
      return 0;
    }
  }

  _buildRateNumber() {
    log(calculateRate().toString());

    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Text(
        '(${calculateRate().round().toString()})',
        style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.productDetails),
      ),
      body: _buildBloc(),
    );
  }
}
