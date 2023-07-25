import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../business_logic/cubit/deals_cubit.dart';

class WorldDealViewItem extends StatelessWidget {
  const WorldDealViewItem({
    super.key,
    required this.leading,
    required this.title,
    required this.index,
    this.onTap,
  });

  final String leading;
  final String title;
  final int index;
  final void Function()? onTap;

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
          color: BlocProvider.of<DealsCubit>(context)
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
        BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(14);
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 20.sp,
        color: BlocProvider.of<DealsCubit>(context)
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
        selected: BlocProvider.of<DealsCubit>(context)
                .worldViewCategoriesDefaultIndex ==
            index,

        contentPadding: EdgeInsets.only(top: 15.h, right: 15.w, left: 30.w),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            side: BorderSide(
              color: BlocProvider.of<DealsCubit>(context)
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
          BlocProvider.of<DealsCubit>(context).worldViewCategoriesDefaultIndex =
              index;
        },
      ),
    );
  }
}
