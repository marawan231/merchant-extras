import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/widgets/custom_network_image.dart';
import 'package:merchant_extras/features/search/business_logic/cubit/search_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../search/business_logic/cubit/search_cubit.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          _buildTitle(context),
          SizedBox(height: 15.h),
          _buildCategoresList(),
        ],
      ),
    );
  }

  _buildCategoresList() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => _buildList(context),
            getCatogoriesLoading: () => _buildEmptyList(),
            getCatogoriesError: (networkExceptions) =>
                Text(networkExceptions.toString()),
            getCatogoriesSuccedded: (data) {
              return _buildList(context);
            });
      },
    );
  }

  _buildEmptyList() {
    return SizedBox(
      height: 62.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildEmptyItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w);
        },
        itemCount: 5,
      ),
    );
  }

  _buildEmptyItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 61.w,
        height: 61.w,
        color: ColorManager.white,
      ),
    );
  }

  _buildList(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildItem(context, index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w);
        },
        itemCount: BlocProvider.of<SearchCubit>(context).categories.length,
      ),
    );
  }

  _buildItem(BuildContext context, int index) {
    // log('imageUrl ${BlocProvider.of<SearchCubit>(context).categories[index].imageUrl}');
    return Container(
        // width: 61.w,
        // height: 61.w,
        decoration: BoxDecoration(
            color: ColorManager.lightPrimary,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 19.h),
        child: CustomNetworkCachedImage(
          width: 22.w,
          height: 22.w,
          color: ColorManager.primary,
          url:
              BlocProvider.of<SearchCubit>(context).categories[index].imageUrl!,
          fit: BoxFit.scaleDown,
        ));
  }

  _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeadline(),
        _buildMore(context),
      ],
    );
  }

  _buildHeadline() {
    return Text(
      AppStrings.categories,
      style: getMediumStyle(
        color: ColorManager.black,
        fontSize: 18.sp,
      ),
    );
  }

  _buildMore(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, RouteManager.allCategoriesView);
        BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(10);
      },
      child: Text(
        AppStrings.more,
        style: getMediumStyle(
          color: ColorManager.primary,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
