import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/features/search/business_logic/cubit/search_state.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/empty_lottie.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../home/presentation/widgets/world_deals_item.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../../../core/resources/strings_manager.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  late final SearchCubit _searchCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  _buildSearchResults() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          current is FilterSucceded ||
          current is FilterLoading ||
          current is SearchSucceded,
      builder: (context, state) {
        return state.maybeWhen(
          filterLoading: () => const Center(child: LoadingIndicator()),
          orElse: () => _buildList(),
        );
      },
    );
  }

  _buildList() {
    return _searchCubit.deals.isEmpty
        ? const EmptyLottie(
            icon: ImageAssets.emptySearchAnimation,
            message: AppStrings.thereAreNoSearchResults)
        : Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9.sp,
                  crossAxisSpacing: 23.w,
                  mainAxisSpacing: 20.h),
              shrinkWrap: true,
              itemCount: _searchCubit.searchedList.isEmpty
                  ? _searchCubit.deals.length
                  : _searchCubit.searchedList.length,
              itemBuilder: (context, index) {
                // if searched list empty return all deals

                return WorldDealsItem(
                  deals: _searchCubit.searchedList.isEmpty
                      ? _searchCubit.deals
                      : _searchCubit.searchedList,
                  index: index,
                  // image: cubit.products[index].imageUrl!,
                  // title: cubit.products[index].name!,
                  // id: cubit.products[index].id!.toString(),
                );
              },
              // separatorBuilder: (context, index) {
              //   return SizedBox(height: 12.h);
              // },
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildTitle(context),
          // SizedBox(height: 20.h),
          _buildSearchResults(),
        ],
      ),
    );
  }
}
