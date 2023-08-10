import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';

class SearchCategoryItem extends StatelessWidget {
  const SearchCategoryItem(
      {super.key, required this.title, required this.image, required this.id});

  final String title;
  final String image;
  final String id;
  _buildSearchCategoryImage() {
    return SizedBox(
      height: 14.h,
      width: 14.w,
      child: CustomNetworkCachedImage(
        url: image,
      ),
    );
  }

  _buildTitle() {
    return Text(title,
        style: getBoldStyle(color: ColorManager.grey, fontSize: 16.sp));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // log('asdasd');
        // Commons.showLoadingDialog(context);
        BlocProvider.of<SearchCubit>(context).productId = id;
        BlocProvider.of<SearchCubit>(context).filter();
      },
      child: Container(
        // height: 31.h,
        // width: 30,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorManager.lightPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSearchCategoryImage(),
            8.horizontalSpace,
            _buildTitle(),
          ],
        ),
      ),
    );
  }
}
