import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';

import '../../business_logic/cubit/search_state.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../widgets/search_categories.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_results.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({
    super.key,
  });

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  late final SearchCubit _searchCubit;
  @override
  void initState() {
    super.initState();
    // _searchCubit = BlocProvider.of<SearchCubit>(context);
    log(BlocProvider.of<SearchCubit>(context).selectedCategoryId.toString());
    BlocProvider.of<SearchCubit>(context).getAllProducts();
    BlocProvider.of<SearchCubit>(context).filter();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _searchCubit.searchedList = [];
    _searchCubit.defaultCategoryIndex = null;
    _searchCubit.resetFilter();
  }

  Widget _buildSearchViewBody() {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          current is FilterSucceded && previous is FilterLoading,
      listener: (context, state) {
        state.whenOrNull(
          filterSucceded: (deals) {
            // setState(() {});
            deals.isEmpty ? Commons.showToast(message: 'لا يوجد نتائج') : null;
            // Navigator.pop(context);
          },
        );
      },
      // buildWhen: (previous, current) => current is FilterSucceded,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
          child: Column(
            children: [
              _buildSearchBar(),
              20.verticalSpace,
              _buildSearchProducts(),
              20.verticalSpace,
              _buildBody(),
            ],
          ),
        );
      },
    );
  }

  // _buildContactUsContainer() {
  //   return Positioned(
  //     bottom: 20.h,
  //     right: 74.w,
  //     left: 75.w,
  //     child: FloatingContainer(
  //         ontap: () {
  //           Navigator.pushNamed(context, Routes.contactUsRoute);
  //         },
  //         title: AppStrings.contactUsForBetter),
  //   );
  // }

  _buildSearchBar() {
    return CustomSearchBar(
      filterVisible: true,
      onChanged: (value) {
        _searchCubit.searchedList = _searchCubit.deals
            .where((element) => element.name!.contains(value))
            .toList();
        log(_searchCubit.searchedList.length.toString());
        _searchCubit.search();
      },
    );
  }

  _buildSearchProducts() {
    return const SearchProducts();
  }

  _buildBody() {
    return const SearchResults();
  }

  // _buildSearchCategories() {
  //   return const SearchCategories();
  // }

  @override
  Widget build(BuildContext context) {
    return _buildSearchViewBody();
    // _buildContactUsContainer(),
  }
}
