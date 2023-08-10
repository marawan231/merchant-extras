import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/business_logic/cubit/global_cubit.dart';
import 'package:merchant_extras/core/resources/route_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../search/business_logic/cubit/search_cubit.dart';
import '../../../search/business_logic/cubit/search_state.dart';
import '../../../search/data/models/category_model.dart';
import '../../../search/presentation/widgets/search_bar.dart';
// import '../widgets/search_categories.dart';

class AllCategoriesView extends StatefulWidget {
  const AllCategoriesView({
    super.key,
  });

  @override
  State<AllCategoriesView> createState() => _AllCategoriesViewState();
}

class _AllCategoriesViewState extends State<AllCategoriesView> {
  late final SearchCubit _searchCubit;
  List<CategoryModel> searchedList = [];

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
    searchedList = [];
  }

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
              20.verticalSpace,
              _buildProducts(),
            ],
          ),
        );
      },
    );
  }

  _buildSearchBar() {
    return CustomSearchBar(
      filterVisible: false,
      hintText: AppStrings.searchForCategory,
      onChanged: (character) {
        setState(() {
          searchedList = _searchCubit.categories
              .where((element) => element.name!.contains(character))
              .toList();
        });
      },
    );
  }

  _buildProducts() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: searchedList.isEmpty
          ? BlocProvider.of<SearchCubit>(context).categories.length
          : searchedList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        // childAspectRatio: 1.2,
        crossAxisSpacing: 18.w,
        mainAxisSpacing: 18.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigator.pushNamed(context, Routes.allDealsRoute);
            BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(1);
            BlocProvider.of<SearchCubit>(context).resetFilter();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImage(index),
                    4.verticalSpace,
                    _buildTitle(index),
                  ],
                ),
              )),
        );
      },
    );
  }

  _buildImage(int index) {
    return CustomNetworkCachedImage(
      width: 25.w,
      height: 25.w,
      color: ColorManager.primary,
      url: searchedList.isEmpty
          ? BlocProvider.of<SearchCubit>(context).categories[index].imageUrl!
          : searchedList[index].imageUrl!,
      fit: BoxFit.scaleDown,
    );
  }

  _buildTitle(int index) {
    return Text(
      searchedList.isEmpty
          ? BlocProvider.of<SearchCubit>(context).categories[index].name ?? ''
          : searchedList[index].name ?? '',
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: getRegularStyle(
        color: ColorManager.primary,
        fontSize: 15.sp,
      ),
    );
  }

  // _buildBody() {
  //   return const SearchResults();
  // }

  // _buildSearchCategories() {
  //   return const SearchCategories();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(AppStrings.categories,
              style: getMediumStyle(
                color: ColorManager.black,
                fontSize: 24.sp,
              )),
        ),
        actions: [
          InkWell(
            onTap: () {
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
      body: _buildSearchViewBody(),
      // _buildContactUsContainer(),
    );
  }
}
