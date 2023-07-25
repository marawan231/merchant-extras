import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/search_cubit.dart';

import '../../../../core/resources/color_manager.dart';

class ArrangeCategoryItem extends StatefulWidget {
  const ArrangeCategoryItem({
    super.key,
    required this.index,
    required this.selectedList,
  });
  final int index;
  final List selectedList;

  @override
  State<ArrangeCategoryItem> createState() => _ArrangeCategoryItemState();
}

class _ArrangeCategoryItemState extends State<ArrangeCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: ChoiceChip(
        // disabledColor: ColorManager.grey,
        pressElevation: 0,
        shadowColor: ColorManager.transparent,
        selectedShadowColor: ColorManager.transparent,
        elevation: 0,
        // labelPadding:
        //     EdgeInsets.only(top: 14.h, left: 35.w, right: 34.w, bottom: 13.h),

        side: BorderSide(
          color: BlocProvider.of<SearchCubit>(context)
                      .arrangmentInFilterFormCategoreisIndex ==
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
          height: 39.h,
          width: 133.w,
          child: Center(
            child: Text(
              widget.selectedList[widget.index],
              style: BlocProvider.of<SearchCubit>(context)
                          .arrangmentInFilterFormCategoreisIndex ==
                      widget.index
                  ? Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Theme.of(context).primaryColor)
                  : Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: ColorManager.grey),
            ),
          ),
        ),
        selected: BlocProvider.of<SearchCubit>(context)
                .arrangmentInFilterFormCategoreisIndex ==
            widget.index,
        selectedColor: ColorManager.transparent,
        onSelected: (value) {
          BlocProvider.of<SearchCubit>(context)
              .arrangmentInFilterFormCategoreisIndex = widget.index;

          BlocProvider.of<SearchCubit>(context).showSelectedArrangmentChoice();
          // BlocProvider.of<SearchCubit>(context)s();
        },
        // elevation: 1,
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * .03),
      ),
    );
  }
}
