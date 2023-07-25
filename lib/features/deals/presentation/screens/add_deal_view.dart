import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_deal_categories.dart';
import '../widgets/negotiation_option.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/headline.dart';
import '../widgets/pattern_categories.dart';
import '../widgets/product_Images.dart';
import '../widgets/product_videos.dart';

class AddDealView extends StatelessWidget {
  const AddDealView({super.key});

  _buildAddDealViewBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 32.h, bottom: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDealCategoryTextField(context),
            SizedBox(height: 32.h),
            _buildDealKindHeadline(),
            SizedBox(height: 15.h),
            _buildAddDealCategories(),
            SizedBox(height: 32.h),
            _buildDealNameTextField(),
            SizedBox(height: 32.h),
            _buildDealDetailsTextfield(),
            SizedBox(height: 32.h),
            _buildMyLocationTextField(context),
            SizedBox(height: 32.h),
            _buildQuantityTextField(context),
            SizedBox(height: 32.h),
            _buildKiloPriceTextfield(context),
            SizedBox(height: 32.h),
            _buildPatternCategories(),
            SizedBox(height: 32.h),
            _buildProductImages(),
            SizedBox(height: 32.h),
            _buildProductVidoes(),
            SizedBox(height: 32.h),
            const NegotiationOption(),
            SizedBox(height: 80.h),
            const DefaultButton(text: AppStrings.addDeal),
          ],
        ),
      ),
    );
  }

  _buildDealCategoryTextField(BuildContext context) {
    return CustomTextField(
        icon: ImageAssets.title,
        title: AppStrings.classifications,
        suffix: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor,
            size: 14.sp,
          ),
        ),
        hint: AppStrings.farmProducts);
  }

  _buildDealNameTextField() {
    return const CustomTextField(
        icon: ImageAssets.fontSize,
        title: AppStrings.dealName,
        suffix: Text(''),
        hint: AppStrings.orangeFlibine);
  }

  _buildDealDetailsTextfield() {
    return CustomTextField(
        contentPadding: EdgeInsets.only(
          top: 79.h,
          right: 20.w,
        ),
        icon: ImageAssets.title,
        title: AppStrings.dealDetails,
        suffix: const Text(''),
        hint: AppStrings.orangeFlibine);
  }

  _buildDealKindHeadline() {
    return const Headline(
        title: AppStrings.dealKing, icon: ImageAssets.location);
  }

  _buildAddDealCategories() {
    return AddDealCategories(selectedList: addDealCategoriesTitles);
  }

  _buildMyLocationTextField(BuildContext context) {
    return CustomTextField(
        icon: ImageAssets.location,
        title: AppStrings.myLocation,
        suffix: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor,
            size: 14.sp,
          ),
        ),
        hint: AppStrings.saudiArabia);
  }

  _buildQuantityTextField(BuildContext context) {
    return CustomTextField(
        icon: ImageAssets.weight,
        title: AppStrings.wantedQuantity,
        suffix: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Text(
            AppStrings.kilo,
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.sp),
          ),
        ),
        hint: AppStrings.thousand);
  }

  _buildKiloPriceTextfield(BuildContext context) {
    return CustomTextField(
        icon: ImageAssets.priceTag,
        title: AppStrings.wantedPrice,
        suffix: Icon(
          Icons.attach_money,
          color: Theme.of(context).primaryColor,
          size: 12.sp,
        ),
        hint: '1');
  }

  _buildPatternCategories() {
    return Column(
      children: [
        const Headline(title: AppStrings.pattern, icon: ImageAssets.menu),
        SizedBox(height: 15.h),
        PatternsCategories(selectedList: patternsList),
      ],
    );
  }

  _buildProductImages() {
    return Column(
      children: [
        const Headline(
            title: AppStrings.productImages, icon: ImageAssets.picture),
        SizedBox(height: 25.h),
        const ProductImages(),
      ],
    );
  }

    _buildProductVidoes() {
      return Column(
        children: [
          const Headline(title: AppStrings.productVideos, icon: ImageAssets.play),
          SizedBox(height: 25.h),
          const ProductVideos(),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.addDeal)),
      body: _buildAddDealViewBody(context),
    );
  }
}
