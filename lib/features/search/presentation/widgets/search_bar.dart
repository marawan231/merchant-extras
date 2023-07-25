import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'filter_form.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  _buildSearchField(BuildContext context) {
    return Expanded(
        child: TextFormField(
      style: Theme.of(context).textTheme.displaySmall,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Image.asset(
          ImageAssets.search,
          // fit: BoxFit.scaleDown,
          width: 20.w,
          height: 20.h,
        ),

        hintText: AppStrings.search,
        // alignLabelWithHint: true,
        // isDense: true,
      ),
    ));
  }

  _buildFilter(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          context: context,
          constraints: BoxConstraints(
            maxWidth: 600.h,
            minWidth: 600.h,
          ),
          builder: (context) {
            return _buildBottomSheet();
          },
        );
      },
      child: Container(
        width: 55.w,
        height: 45.h,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Image.asset(
          ImageAssets.filter,
          width: 20.w,
          height: 20.h,
        ),
      ),
    );
  }

  _buildBottomSheet() {
    return BlocProvider.value(
      value: RouteGenerator.homeCubit,
      child: SizedBox(
        height: 725.h,
        child: Padding(
          padding:
              EdgeInsets.only(right: 20.w, left: 20.w, top: 52.h, bottom: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildBottomSheetTitle(),
                20.heightSpace(),
                _buildFilterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFilterForm() {
    return BlocProvider.value(
      value: RouteGenerator.searchCubit,
      child: const FilterForm(),
    );
  }

  _buildBottomSheetTitle() {
    return Text(
      AppStrings.filter,
      style: getBoldStyle(color: ColorManager.black, fontSize: 20.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: Row(
        children: [
          _buildSearchField(context),
          SizedBox(width: 10.w),
          _buildFilter(context),
        ],
      ),
    );
  }
}
