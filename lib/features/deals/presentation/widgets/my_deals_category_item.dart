import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';

import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/deals_cubit.dart';

import '../../../../core/resources/color_manager.dart';

class MyDealsCategoryItem extends StatefulWidget {
  const MyDealsCategoryItem({
    super.key,
    required this.index,
    // required this.selectedList,
  });
  final int index;
  // final List<String> selectedList;

  @override
  State<MyDealsCategoryItem> createState() => _MyDealsCategoryItemState();
}

class _MyDealsCategoryItemState extends State<MyDealsCategoryItem> {
  getTitle() {
    switch (myDealsCategories[widget.index].id!) {
      case 1:
        return AppStrings.all;
      case 2:
        return AppStrings.shipMaking;
      case 3:
        return AppStrings.transaferProgressing;
      case 4:
        return AppStrings.onWay;
      case 5:
        return AppStrings.completed;
      case 6:
        return AppStrings.closed;

      default:
        null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      // surfaceTintColor: ColorManager.error,

      // clipBehavior: Clip.none

      // disabledColor: ColorManager.grey,
      pressElevation: 0.0,
      shadowColor: ColorManager.transparent,
      selectedShadowColor: ColorManager.transparent,
      // disabledColor: ColorManager.transparent,

      elevation: 0,

      labelPadding: EdgeInsets.only(right: 28.w, left: 28.w),

      side: BorderSide(
        color: BlocProvider.of<DealsCubit>(context).defaultCategoryIndex ==
                widget.index
            ? Theme.of(context).primaryColor
            : ColorManager.transparent,
      ),
      backgroundColor: ColorManager.grey.withOpacity(.10),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
      ),

      label: SizedBox(
        // width: 165.w,
        height: 40.h,
        child: Center(
          child: Text(
            getTitle(),
            style: BlocProvider.of<DealsCubit>(context).defaultCategoryIndex ==
                    widget.index
                ? getRegularStyle(color: ColorManager.white, fontSize: 15.sp)
                : getRegularStyle(color: ColorManager.grey, fontSize: 15.sp),
          ),
        ),
      ),
      selected: BlocProvider.of<DealsCubit>(context).defaultCategoryIndex ==
          widget.index,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (value) {
        BlocProvider.of<DealsCubit>(context).defaultCategoryIndex =
            widget.index;

        BlocProvider.of<DealsCubit>(context)
            .changeCategory(myDealsCategories[widget.index].name!);
        log(myDealsCategories[widget.index].name!);
      },
    );
  }
}
