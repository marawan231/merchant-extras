import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/business_logic/cubit/global_cubit.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import 'package:merchant_extras/features/home/business_logic/home_cubit.dart';
import 'package:merchant_extras/features/home/business_logic/home_state.dart';
import 'package:merchant_extras/features/home/presentation/widgets/world_deals_item.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/strings_manager.dart';

import '../../../../core/widgets/empty_lottie.dart';

// import '../widgets/search_categories.dart';

class AllDealsView extends StatefulWidget {
  const AllDealsView({
    super.key,
  });

  @override
  State<AllDealsView> createState() => _AllDealsViewState();
}

class _AllDealsViewState extends State<AllDealsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    // BlocProvider.of<HomeCubit>(context).resetFilter();

    super.dispose();
  }

  _buildDeals() {
    // log('deals ${BlocProvider.of<HomeCubit>(context).deals.length}');
    return BlocProvider.of<HomeCubit>(context).internationalDeals.isEmpty
        ? const EmptyLottie(
            icon: ImageAssets.boxAnimation,
            message: AppStrings.noDealsImmediately,
            height: 300,
          )
        : GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            itemCount:
                BlocProvider.of<HomeCubit>(context).internationalDeals.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .87.sp,
                crossAxisSpacing: 23.w,
                mainAxisSpacing: 20.h),
            itemBuilder: (context, index) {
              return WorldDealsItem(
                  deals: BlocProvider.of<HomeCubit>(context).internationalDeals,
                  index: index);
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(AppStrings.topDeals,
              style: getMediumStyle(
                color: ColorManager.black,
                fontSize: 24.sp,
              )),
        ),
        actions: [
          InkWell(
            onTap: () {
              BlocProvider.of<HomeCubit>(context).internationalDeals = [];

              BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(0);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, left: 8.w),
              child: Icon(
                Icons.clear,
                size: 26.sp,
                color: ColorManager.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildDeals();
        },
      ),
      // _buildContactUsContainer(),
    );
  }
}
