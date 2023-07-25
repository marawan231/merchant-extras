// import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/widgets/custom_network_image.dart';
// import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/home_cubit.dart';
import '../../business_logic/home_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

import 'more_button.dart';

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
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
        autoPlay: true,
        aspectRatio: 16 / 9,
      ),
      items: List.generate(
        BlocProvider.of<HomeCubit>(context).sliders!.length,
        (index) => Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              // color: ColorManager.error,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Stack(
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
        ),
      ),
    );
  }

  _buildBackGroundImage(String imageUrl) {
    return CustomNetworkCachedImage(
      url: imageUrl,
      filter: ColorFilter.mode(
          ColorManager.black.withOpacity(.45), BlendMode.darken),
    );
  }

  _buildFeatureDetails(int index, String title, String urlLink) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 40.h),
      child: Center(
        child: Column(
          children: [
            _buildFeaturetitle(title),
            SizedBox(height: 35.h),
            MoreButton(
              index: index,
              urlLink: urlLink,
            ),
          ],
        ),
      ),
    );
  }

  _buildFeaturetitle(String title) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: getBoldStyle(color: ColorManager.white, fontSize: 22.sp),
    );
  }

  _buildLoadingAds() {
    return SizedBox(
      height: 200.h,
      width: 300.w,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
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
