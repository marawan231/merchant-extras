import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/empty_lottie.dart';
import '../../../../core/resources/utils.dart';
import '../../business_logic/home_cubit.dart';
import '../../business_logic/home_state.dart';

import '../../../../core/resources/strings_manager.dart';
import 'world_deals_item.dart';

class WorldDeals extends StatelessWidget {
  const WorldDeals({super.key});

  _buildWorldDeals(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 22.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(height: 15.h),
          _buildDeals(),
        ],
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.bestWorldDeals,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: 18.sp,
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(11);
          },
          child: Text(
            AppStrings.more,
            style: getMediumStyle(
              color: ColorManager.primary,
              fontSize: 18.sp,
            ),
          ),
        ),
      ],
    );
  }

  _buildDeals() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, next) =>
          next is HomeTopInternationalDealsSuccess ||
          next is HomeTopInternationalDealsLoading,
      builder: (context, state) {
        return state.maybeWhen(
            homeSlidersLoading: () => buildEmptyDeals(),
            homeTopInternationalDealsLoading: () => buildEmptyDeals(),
            homeTopInternationalDealsSuccess: (deals) {
              log('deals.length ${deals.length}');
              return _buildDealsView(context);
            },
            homeTopInternationalDealsError: (networkExceptions) {
              return Text(networkExceptions.toString());
            },
            orElse: () {
              return _buildDealsView(context);
            });
      },
    );
  }

  _buildDealsView(BuildContext context) {
    //test empty
    // BlocProvider.of<HomeCubit>(context).internationalDeals = [];
    return BlocProvider.of<HomeCubit>(context).internationalDeals.isEmpty
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EmptyLottie(
                icon: ImageAssets.boxAnimation,
                message: AppStrings.noDealsImmediately,
                height: 150,
              )
            ],
          )
        : AspectRatio(
            aspectRatio: 1.7.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return WorldDealsItem(
                    deals:
                        BlocProvider.of<HomeCubit>(context).internationalDeals!,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 18.w);
                },
                itemCount: BlocProvider.of<HomeCubit>(context)
                    .internationalDeals!
                    .length),
          );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeCubit>(context).getInternationalTopDeals();

    return _buildWorldDeals(context);
  }
}
