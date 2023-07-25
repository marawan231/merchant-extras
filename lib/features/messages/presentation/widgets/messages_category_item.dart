import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/messages_cubit.dart';

class MessagesCategoryItem extends StatefulWidget {
  const MessagesCategoryItem({
    super.key,
    required this.index,
    required this.title,
  });
  final int index;
  final String title;

  @override
  State<MessagesCategoryItem> createState() => _MessagesCategoryItemState();
}

class _MessagesCategoryItemState extends State<MessagesCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      pressElevation: 0.0,
      shadowColor: ColorManager.transparent,
      selectedShadowColor: ColorManager.transparent,
      elevation: 0,
      side: BorderSide(
        color:
            BlocProvider.of<MessagesCubit>(context).defaultMessagesCategories ==
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
        width: 165.w,
        height: 49.h,
        child: Padding(
          padding: EdgeInsets.only(right: 25.w, top: 8.h),
          child: Text(
            widget.title,
            style: BlocProvider.of<MessagesCubit>(context)
                        .defaultMessagesCategories ==
                    widget.index
                ? getRegularStyle(color: ColorManager.white, fontSize: 15.sp)
                : getRegularStyle(color: ColorManager.grey, fontSize: 15.sp),
          ),
        ),
      ),
      selected:
          BlocProvider.of<MessagesCubit>(context).defaultMessagesCategories ==
              widget.index,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (value) {
        BlocProvider.of<MessagesCubit>(context).defaultMessagesCategories =
            widget.index;
        BlocProvider.of<MessagesCubit>(context).showSelectedView();
      },
   
    );
  }
}
