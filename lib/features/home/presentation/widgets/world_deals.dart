import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../../../core/resources/utils.dart';
import '../../business_logic/home_cubit.dart';
import '../../business_logic/home_state.dart';

import '../../../../core/resources/strings_manager.dart';
import 'world_deals_item.dart';

class WorldDeals extends StatelessWidget {
  const WorldDeals({super.key});

  _buildWorldDeals(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
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
    return Text(
      AppStrings.bestWorldDeals,
      style: Theme.of(context).textTheme.headlineSmall,
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
    return BlocProvider.of<HomeCubit>(context).internationalDeals! == []
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EmptyScreen(),
            ],
          )
        : AspectRatio(
            aspectRatio: 1.6.h,
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
