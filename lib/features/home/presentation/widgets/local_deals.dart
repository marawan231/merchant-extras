import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../../../core/resources/utils.dart';
import '../../business_logic/home_cubit.dart';
import '../../business_logic/home_state.dart';

import '../../../../core/resources/strings_manager.dart';
import 'world_deals_item.dart';

class LocalDeals extends StatelessWidget {
  const LocalDeals({super.key});

  _buildLocalDeals(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(height: 15.h),
          _buildDeals(),
          //Todo space at bottom
          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Text(
      AppStrings.bestLocalDeals,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  _buildDeals() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          current is HomeTopLocalDealsSuccess ||
          current is HomeTopLocalDealsLoading,
      builder: (context, state) {
        return state.maybeWhen(
            homeTopLocalDealsLoading: () => buildEmptyDeals(),
            homeTopLocalDealsSuccess: (deals) {
              return _buildDealsView(context);
            },
            orElse: () {
              return BlocProvider.of<HomeCubit>(context).localDeals != null
                  ? _buildDealsView(context)
                  : buildEmptyDeals();
            });
      },
    );
  }

  _buildDealsView(BuildContext context) {
    return BlocProvider.of<HomeCubit>(context).localDeals == []
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
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return WorldDealsItem(
                    index: index,
                    deals: BlocProvider.of<HomeCubit>(context).localDeals!,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 18.w);
                },
                itemCount:
                    BlocProvider.of<HomeCubit>(context).localDeals!.length),
          );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeCubit>(context).getLocalTopDeals();

    return _buildLocalDeals(context);
  }
}
