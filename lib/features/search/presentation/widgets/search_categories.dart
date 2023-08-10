import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
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
    return Row(
      children: [
        Container(
          height: 31.h,
          padding: EdgeInsets.only(left: 31.w, right: 31.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorManager.primary,
          ),
          child: Center(
            child: Text(
              AppStrings.all,
              style: getMediumStyle(
                fontSize: 15.sp,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: SizedBox(
            height: 33.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.only(right: 4.w, left: 4.w, top: 40.h),
              physics: const ScrollPhysics(),
              // shrinkWrap: true,
              itemCount: cubit.products.length,
              itemBuilder: (context, index) {
                return SearchCategoryItem(
                  image: cubit.products[index].imageUrl!,
                  title: cubit.products[index].name!,
                  id: cubit.products[index].id!.toString(),
                );
              },
              separatorBuilder: (context, index) => 10.horizontalSpace,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSearchCategoriesList();
  }
}
