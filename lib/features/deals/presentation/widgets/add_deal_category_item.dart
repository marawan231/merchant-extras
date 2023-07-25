import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/deals_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class AddDealCategoryItem extends StatefulWidget {
  const AddDealCategoryItem({
    super.key,
    required this.index,
    required this.selectedList,
  });
  final int index;
  final List selectedList;

  @override
  State<AddDealCategoryItem> createState() => _AddDealCategoryItemState();
}

class _AddDealCategoryItemState extends State<AddDealCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: ChoiceChip(
        pressElevation: 0.0,
        shadowColor: ColorManager.transparent,
        selectedShadowColor: ColorManager.transparent,
        elevation: 0,
        side: BorderSide(
          color: BlocProvider.of<DealsCubit>(context).defaultDealTypeCategory ==
                  widget.index
              ? Theme.of(context).primaryColor
              : ColorManager.transparent,
        ),
        backgroundColor:
            BlocProvider.of<DealsCubit>(context).defaultDealTypeCategory ==
                    widget.index
                ? ColorManager.white
                : ColorManager.grey.withOpacity(.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        label: SizedBox(
          width: 135.w,
          height: 39.h,
          child: Center(
            child: Text(
              widget.selectedList[widget.index],
              style: BlocProvider.of<DealsCubit>(context)
                          .defaultDealTypeCategory ==
                      widget.index
                  ? getBoldStyle(
                      color: Theme.of(context).primaryColor, fontSize: 14.sp)
                  : getBoldStyle(color: ColorManager.grey, fontSize: 14.sp),
            ),
          ),
        ),
        selected:
            BlocProvider.of<DealsCubit>(context).defaultDealTypeCategory ==
                widget.index,
        selectedColor: ColorManager.transparent,
        onSelected: (value) {
          BlocProvider.of<DealsCubit>(context).defaultDealTypeCategory =
              widget.index;

          BlocProvider.of<DealsCubit>(context).showSelectedDealType();
        },
      ),
    );
  }
}
