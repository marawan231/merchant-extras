import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../deals/data/model/deal_model.dart';

class SearchItemDetailsImageSlider extends StatelessWidget {
  const SearchItemDetailsImageSlider({super.key, required this.images});
  final List<Images> images;

  Widget _buildCompanyFeatures() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.h,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        images.length,
        (index) => Container(
          decoration: BoxDecoration(
              // color: ColorManager.error,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Stack(
            children: [
              _buildBackGroundImage(index),
              // _buildFeatureDetails(index),
            ],
          ),
        ),
      ),
    );
  }

  _buildBackGroundImage(int index) {
    return CustomNetworkCachedImage(
      url: images[index].attachmentUrl!,
      filter: ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.darken),
      fit: BoxFit.fill,
    );

    // Container(
    //   decoration: BoxDecoration(
    //     // color: ColorManager.white,
    //     borderRadius: BorderRadius.all(Radius.circular(5.r)),
    //     image: DecorationImage(
    //       colorFilter:
    //           ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.darken),
    //       fit: BoxFit.fill,
    //       image: const AssetImage(ImageAssets.cherry),
    //     ),
    //   ),
    // );
  }

  // _buildFeatureDetails(int index) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 40.h),
  //     child: Column(
  //       children: [
  //         _buildFeaturetitle(),
  //         SizedBox(height: 35.h),
  //         // MoreButton(index: index),
  //       ],
  //     ),
  //   );
  // }

  // _buildFeaturetitle() {
  //   return Text(
  //     textAlign: TextAlign.center,
  //     AppStrings.helpYou,
  //     style: getBoldStyle(color: ColorManager.white, fontSize: 22.sp),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return _buildCompanyFeatures();
  }
}
