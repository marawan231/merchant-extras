// import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import 'package:merchant_extras/core/widgets/custom_network_image.dart';
// import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/home_cubit.dart';
import '../../business_logic/home_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CompanyFeatures extends StatelessWidget {
  const CompanyFeatures({super.key});

  Widget _buildCompanyFeatures() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, next) =>
          next is HomeSlidersSuccess || next is HomeSlidersLoading,
      builder: (context, state) {
        return state.maybeWhen(
          homeSlidersLoading: () {
            return _buildLoadingAds();
          },
          homeSlidersSuccess: (sliders) {
            return _buildCrausoal(context);
          },
          homeSlidersError: (networkExceptions) {
            return Text(networkExceptions.toString());
          },
          orElse: () {
            return _buildCrausoal(context);
          },
        );
      },
    );
  }

  _buildCrausoal(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 12.w),
      child: SizedBox(
        height: 140.h,
        // width: 327.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemBuilder: (context, index) => _buildItem(context, index),
          separatorBuilder: (context, index) => SizedBox(
            width: 17.w,
          ),
          itemCount: BlocProvider.of<HomeCubit>(context).sliders!.length,
        ),
      ),
    );
  }

  _buildItem(BuildContext context, int index) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          // color: ColorManager.background,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Stack(
        // fit: StackFit.passthrough,
        children: [
          _buildBackGroundImage(
            BlocProvider.of<HomeCubit>(context).sliders![index].image!,
          ),
          _buildFeatureDetails(
            index,
            BlocProvider.of<HomeCubit>(context).sliders![index].name!,
            BlocProvider.of<HomeCubit>(context).sliders![index].link!,
          ),
        ],
      ),
    );
  }

  _buildBackGroundImage(String imageUrl) {
    // log('imageUrl $imageUrl');
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: CustomNetworkCachedImage(
        height: 128.h,
        width: 294.w,
        url: imageUrl,
        fit: BoxFit.cover,
        filter: ColorFilter.mode(
            ColorManager.black.withOpacity(.45), BlendMode.darken),
      ),
    );
  }

  _buildFeatureDetails(int index, String title, String urlLink) {
    return Padding(
      padding: EdgeInsets.only(left: 0.w, right: 16.w, top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFeaturetitle(),
          SizedBox(height: 4.h),
          _buildSubtitle(title),
          // MoreButton(
          //   index: index,
          //   urlLink: urlLink,
          // ),
        ],
      ),
    );
  }

  _buildFeaturetitle() {
    return Text(
      // textAlign: TextAlign.center,
      AppStrings.discover,
      style: getBoldStyle(color: ColorManager.white, fontSize: 30.sp),
    );
  }

  _buildSubtitle(String title) {
    return Text(
      // textAlign: TextAlign.center,
      title,
      style: getMediumStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildLoadingAds() {
    return Container(
      height: 128.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeCubit>(context).getAllSliders();

    return _buildCompanyFeatures();
  }
}
