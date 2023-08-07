import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';

import '../../business_logic/cubit/search_state.dart';
import '../../../../core/resources/route_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../widgets/search_categories.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/floating_container.dart';

// import '../widgets/search_categories.dart';
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
    log(BlocProvider.of<SearchCubit>(context).selectedCategoryId.toString());
    BlocProvider.of<SearchCubit>(context).getAllProducts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _searchCubit.resetFilter();
  }

  //todo add categories view before search
  Widget _buildSearchViewBody() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        state.whenOrNull(
          filterSucceded: (categories) {
            categories.isEmpty
                ? Commons.showToast(message: 'لا يوجد نتائج')
                : null;
            Navigator.pop(context);
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
          child: Column(
            children: [
              _buildSearchBar(),

              _searchCubit.deals.isEmpty
                  ? _buildSearchProducts()
                  : _buildBody(),
              // _buildBody(),
              // _buildContactUsContainer()
            ],
          ),
        );
      },
    );
  }

  _buildContactUsContainer() {
    return Positioned(
      bottom: 20.h,
      right: 74.w,
      left: 75.w,
      child: FloatingContainer(
          ontap: () {
            Navigator.pushNamed(context, Routes.contactUsRoute);
          },
          title: AppStrings.contactUsForBetter),
    );
  }

  _buildSearchBar() {
    return const CustomSearchBar(
      filterVisible: true,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.theSearch),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // BlocProvider.of<GlobalCubit>(context).backTo(5);
          },
        ),
      ),
      body: Stack(
        children: [
          _buildSearchViewBody(),
          _buildContactUsContainer(),
        ],
      ),
    );
  }
}
