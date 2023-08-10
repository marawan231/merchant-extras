import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../business_logic/cubit/search_cubit.dart';

class SearchCategoryItem extends StatefulWidget {
  const SearchCategoryItem(
      {super.key,
      required this.title,
      required this.image,
      required this.id,
      required this.index});

  final String title;
  final String image;
  final int id;
  final int index;

  @override
  State<SearchCategoryItem> createState() => _SearchCategoryItemState();
}

class _SearchCategoryItemState extends State<SearchCategoryItem> {
  _buildSearchCategoryImage() {
    return SizedBox(
      height: 14.h,
      width: 14.w,
      child: CustomNetworkCachedImage(
        url: widget.image,
      ),
    );
  }

  // _buildTitle() {
  //   return Text(widget.title,
  //       style: getBoldStyle(color: ColorManager.grey, fontSize: 16.sp));
  // }

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
      labelPadding: EdgeInsets.only(right: 8.w, left: 8.w),

      side: BorderSide(
        color: BlocProvider.of<SearchCubit>(context).defaultCategoryIndex ==
                widget.index
            ? Theme.of(context).primaryColor
            : ColorManager.transparent,
      ),
      backgroundColor: ColorManager.lightPrimary,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),

      label: SizedBox(
        // width: 165.w,
        height: 31.h,
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Center(
            child: Row(
              children: [
                _buildSearchCategoryImage(),
                8.horizontalSpace,
                Text(
                  widget.title,
                  style: BlocProvider.of<SearchCubit>(context)
                              .defaultCategoryIndex ==
                          widget.index
                      ? getMediumStyle(
                          color: ColorManager.white, fontSize: 15.sp)
                      : getMediumStyle(
                          color: ColorManager.primary, fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      selected: BlocProvider.of<SearchCubit>(context).defaultCategoryIndex ==
          widget.index,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (value) {
        BlocProvider.of<SearchCubit>(context).defaultCategoryIndex =
            widget.index;
        BlocProvider.of<SearchCubit>(context).productId = widget.id.toString();
        BlocProvider.of<SearchCubit>(context).filter();

        // BlocProvider.of<SearchCubit>(context)
        //     .changeCategory(myDealsCategories[widget.index].name!);
        // log(myDealsCategories[widget.index].name!);
      },
    );
    // return InkWell(
    //   onTap: () {
    //     // log('asdasd');
    //     // Commons.showLoadingDialog(context);

    //   },
    //   child: Container(
    //     // height: 31.h,
    //     // width: 30,
    //     padding: EdgeInsets.symmetric(horizontal: 12.w),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10.r),
    //       color: ColorManager.lightPrimary,
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         _buildSearchCategoryImage(),
    //         8.horizontalSpace,
    //         _buildTitle(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
