import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
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
    return ChoiceChip(
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
            : ColorManager.borderInInputTextFiefld,
      ),
      // if seleted the color will be primary color and if not will be lightwhite
      backgroundColor: BlocProvider.of<SearchCubit>(context)
                  .arrangmentInFilterFormCategoreisIndex ==
              widget.index
          ? Theme.of(context).primaryColor
          : ColorManager.lightWhite,
      //if selected the and the index is 1 so border radius will be 10 top left and bottom left and if index = 0
      //so border radius will be 10 top right and bottom right
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            widget.index == 1 ? 10.r : 0,
          ),
          bottomLeft: Radius.circular(
            widget.index == 1 ? 10.r : 0,
          ),
          topRight: Radius.circular(
            widget.index == 0 ? 10.r : 0,
          ),
          bottomRight: Radius.circular(
            widget.index == 0 ? 10.r : 0,
          ),
        ),
      ),

      label: SizedBox(
        height: 39.h,
        width: 133.w,
        child: Center(
          child: Text(widget.selectedList[widget.index],
              style: BlocProvider.of<SearchCubit>(context)
                          .arrangmentInFilterFormCategoreisIndex ==
                      widget.index
                  ? getRegularStyle(fontSize: 15.sp, color: ColorManager.white)
                  : getRegularStyle(
                      fontSize: 15.sp, color: ColorManager.black)),
        ),
      ),
      selected: BlocProvider.of<SearchCubit>(context)
              .arrangmentInFilterFormCategoreisIndex ==
          widget.index,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (value) {
        BlocProvider.of<SearchCubit>(context)
            .arrangmentInFilterFormCategoreisIndex = widget.index;

        BlocProvider.of<SearchCubit>(context).showSelectedArrangmentChoice();
        // BlocProvider.of<SearchCubit>(context)s();
      },
      // elevation: 1,
      // padding: EdgeInsets.symmetric(
      //     horizontal: MediaQuery.of(context).size.width * .03),
    );
  }
}
