import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/search_state.dart';

import 'search_category_item.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key});

  _buildSearchCategoriesList() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          getProductsSuccedded: (products) {
            return _buildGrid(context);
          },
          orElse: () {
            return _buildGrid(context);
          },
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return GridView.builder(
      padding: EdgeInsets.only(right: 4.w, left: 4.w, top: 40.h),
      physics: const ScrollPhysics(),
      // dragStartBehavior: DragStartBehavior.down,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160.w,
        childAspectRatio: .8.sp,
        crossAxisSpacing: 0.w,
        mainAxisSpacing: 16.h,
      ),
      shrinkWrap: true,
      itemCount: cubit.products.length,
      itemBuilder: (context, index) {
        return SearchCategoryItem(
          image: cubit.products[index].imageUrl!,
          title: cubit.products[index].name!,
          id: cubit.products[index].id!.toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSearchCategoriesList();
  }
}
