import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/deals_cubit.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.index,
    required this.selectedList,
  });
  final int index;
  final List selectedList;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
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

      // labelPadding: EdgeInsets.only(bottom: 8.h),

      side: BorderSide(
        color: BlocProvider.of<DealsCubit>(context).defaultDealStatusCategory ==
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
        width: widget.index == 0 ? 60.w : 135.w,
        height: 35.h,
        child: Center(
          child: Text(
            widget.selectedList[widget.index],
            style: BlocProvider.of<DealsCubit>(context)
                        .defaultDealStatusCategory ==
                    widget.index
                ? getRegularStyle(color: ColorManager.white, fontSize: 15.sp)
                : getRegularStyle(color: ColorManager.grey, fontSize: 15.sp),
          ),
        ),
      ),
      selected:
          BlocProvider.of<DealsCubit>(context).defaultDealStatusCategory ==
              widget.index,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (value) {
        BlocProvider.of<DealsCubit>(context).defaultDealStatusCategory =
            widget.index;

        BlocProvider.of<DealsCubit>(context).showSelectedStatusView();
      },
      
    );
  }
}
