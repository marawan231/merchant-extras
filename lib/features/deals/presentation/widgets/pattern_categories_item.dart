import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/deals_cubit.dart';

import '../../../../core/resources/color_manager.dart';

class PatternsCategoryItem extends StatefulWidget {
  const PatternsCategoryItem({
    super.key,
    required this.index,
    required this.selectedList,
  });
  final int index;
  final List selectedList;

  @override
  State<PatternsCategoryItem> createState() => _PatternsCategoryItemState();
}

class _PatternsCategoryItemState extends State<PatternsCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      // disabledColor: ColorManager.grey,
      pressElevation: 0,
      shadowColor: ColorManager.transparent,
      selectedShadowColor: ColorManager.transparent,
      elevation: 0,
      visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
      labelPadding:
          EdgeInsets.only(top: 8.h, bottom: 8.h, left: 30.w, right: 30.w),
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

      side: BorderSide(
        color:
            BlocProvider.of<DealsCubit>(context).defaultDealPatternCategory ==
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
        height: 30.h,
        child: Text(
          widget.selectedList[widget.index],
          style:
              BlocProvider.of<DealsCubit>(context).defaultDealPatternCategory ==
                      widget.index
                  ? Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Theme.of(context).primaryColor)
                  : Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.grey,
                      ),
        ),
      ),
      selected:
          BlocProvider.of<DealsCubit>(context).defaultDealPatternCategory ==
              widget.index,
      selectedColor: ColorManager.transparent,
      onSelected: (value) {
        setState(() {
          BlocProvider.of<DealsCubit>(context).defaultDealPatternCategory =
              value
                  ? widget.index
                  : BlocProvider.of<DealsCubit>(context)
                      .defaultDealPatternCategory;

          BlocProvider.of<DealsCubit>(context).showSelectedPattern();
        });
      },
 
    );
  }
}
