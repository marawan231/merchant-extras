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
      width: 60.w,
      height: 60.h,
      child: ClipOval(
        child: CustomNetworkCachedImage(
          url: image,
        ),
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
        log('asdasd');
        Commons.showLoadingDialog(context);
        BlocProvider.of<SearchCubit>(context).productId = id;
        BlocProvider.of<SearchCubit>(context).filter();  
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSearchCategoryImage(),
          SizedBox(height: 12.h),
          _buildTitle(),
        ],
      ),
    );
  }
}
