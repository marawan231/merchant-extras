import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';

class WorldViewItem extends StatelessWidget {
  const WorldViewItem({
    super.key,
    required this.leading,
    required this.title,
    required this.index,
    this.onTap,
    required this.id,
  });

  final String leading;
  final String title;
  final int index;
  final void Function()? onTap;
  final String id;

  Widget _buildLeading() {
    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: ClipOval(child: CustomNetworkCachedImage(url: leading)),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: getBoldStyle(
          color: BlocProvider.of<SearchCubit>(context)
                      .worldViewCategoriesDefaultIndex ==
                  index
              ? Theme.of(context).primaryColor
              : ColorManager.grey,
          fontSize: 18.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SearchCubit>(context).selectedCategoryId = id;
        log('id: $id');
        Navigator.pushNamed(context, Routes.searchResultViewRoute);
        // BlocProvider.of<SearchCubit>(context).showWorldViewSelectedVIew();
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 20.sp,
        color: BlocProvider.of<SearchCubit>(context)
                    .worldViewCategoriesDefaultIndex ==
                index
            ? Theme.of(context).primaryColor
            : ColorManager.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: ListTile(
        // selectedTileColor: ColorManager.grey,
        selected: BlocProvider.of<SearchCubit>(context)
                .worldViewCategoriesDefaultIndex ==
            index,

        contentPadding: EdgeInsets.only(top: 15.h, right: 15.w, left: 30.w),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: BlocProvider.of<SearchCubit>(context)
                          .worldViewCategoriesDefaultIndex ==
                      index
                  ? Theme.of(context).primaryColor
                  : ColorManager.cfGrey,
              width: 1.sp,
            )),
        leading: _buildLeading(),
        title: _buildTitle(context),
        trailing: _buildTrailing(context),

        onTap: () {
          BlocProvider.of<SearchCubit>(context)
              .worldViewCategoriesDefaultIndex = index;
        },
      ),
    );
  }
}
