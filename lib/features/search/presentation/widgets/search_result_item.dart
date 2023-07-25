import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/widgets/custom_network_image.dart';
import 'package:merchant_extras/features/search/business_logic/cubit/search_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class SearchResultItem extends StatefulWidget {
  const SearchResultItem({super.key, required this.index});

  final int index;

  @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  late final SearchCubit _searchCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  _buildNumberLabel() {
    return Container(
      width: 35.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: ColorManager.lightWhite,
        // border: Border.all(color: ColorManager.cfGrey),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '0${widget.index + 1}',
          style: getBoldStyle(color: ColorManager.seventyGrey, fontSize: 14.sp),
        ),
      ),
    );
  }

  _buildResultContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.searchResultDealItemDetails,
            arguments: {
              'deal': _searchCubit.deals[widget.index],
            });
      },
      child: Container(
        width: 290.w,
        // height: 122.h,
        decoration: BoxDecoration(
          // border: Border.all(color: ColorManager.cfGrey),
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItemImage(),
            _buildResultItemDetails(),
            _buildArrow(context),
          ],
        ),
      ),
    );
  }

  _buildItemImage() {
    return Padding(
      padding: EdgeInsets.only(top: 30.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        child: SizedBox(
          width: 60.w,
          height: 60.h,
          child: CustomNetworkCachedImage(
            url: _searchCubit.deals[widget.index].images![0].attachmentUrl!,
          ),
        ),
      ),
    );
  }

  _buildResultItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 17.h),
        _buildSearchItemTitle(),
        SizedBox(height: 6.h),
        _buildSearchItemOwner(),
        SizedBox(height: 11.h),
        _buildRemainingAmount(),
        // SizedBox(height: 11.h),
        // _buildStars(),
      ],
    );
  }

  _buildSearchItemTitle() {
    return Text(
      _searchCubit.deals[widget.index].name ?? '',
      style: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildSearchItemOwner() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPriceTagIcon(),
        SizedBox(width: 8.w),
        _buildPriceForUnit(),
        SizedBox(width: 10.w),
        _buildUserItemWeightIcon(),
        SizedBox(width: 8.w),
        _buildTotalAmount(),
      ],
    );
  }

  _buildTotalAmount() {
    return Text(
      "${_searchCubit.deals[widget.index].buyInformation!.totalAmount.toString()} ${AppStrings.kForTotalAmount}",
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 10.sp),
    );
  }

  _buildUserItemWeightIcon() {
    return Image.asset(
      ImageAssets.weight,
      width: 10.w,
      height: 10.h,
    );
  }

  _buildRemainingAmountText() {
    return Text(
      "${_searchCubit.deals[widget.index].buyInformation!.currentAmount} ${AppStrings.remainingAmount}",
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 10.sp),
    );
  }

  _buildRemainingAmount() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildUserItemWeightIcon(),
        SizedBox(width: 8.w),
        _buildRemainingAmountText(),
        // _buildPriceForUnit(),
        // SizedBox(width: 10.w),
      ],
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
      "${_searchCubit.deals[widget.index].price}${'\$'} ${AppStrings.priceForUnit}",
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 10.sp),
    );
  }

// //TODO country name
//   _buildLocationIcon() {
//     return Image.asset(
//       ImageAssets.location,
//       width: 10.w,
//       height: 10.h,
//     );
//   }

//   _buildLocationValue() {
//     return Text(
//       AppStrings.kewit,
//       style: getRegularStyle(color: ColorManager.grey, fontSize: 10.sp),
//     );
//   }

//   _buildStars() {
//     return Row(
//       children: [
//         //Todo replace stars
//         Image.asset(
//           ImageAssets.stars,
//           width: 85.w,
//           height: 13.h,
//         ),
//         SizedBox(width: 5.w),

//         Text(
//           '(3)',
//           style: getRegularStyle(color: ColorManager.grey, fontSize: 10.sp),
//         )
//       ],
//     );
//   }

  _buildArrow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor, size: 12.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 122.h,
      // color: ColorManager.error,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNumberLabel(),
          SizedBox(width: 10.w),
          _buildResultContainer(context),
        ],
      ),
    );
  }
}
