import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../deals/data/model/deal_model.dart';

class SearchItemDetailsImageSlider extends StatefulWidget {
  const SearchItemDetailsImageSlider({super.key, required this.images});
  final List<Images> images;

  @override
  State<SearchItemDetailsImageSlider> createState() =>
      _SearchItemDetailsImageSliderState();
}

class _SearchItemDetailsImageSliderState
    extends State<SearchItemDetailsImageSlider> {
  final PageController _pageController = PageController();
  Widget _buildCompanyFeatures() {
    return SizedBox(
      height: 200.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: _buildBackGroundImage(index),
          );
        },
        onPageChanged: (index) {
          // Handle page change here if needed
        },
      ),
    );
  }

  _buildBackGroundImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      ),
      child: CustomNetworkCachedImage(
        url: widget.images[index].attachmentUrl!,
        // filter: ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.darken),
        fit: BoxFit.cover,
      ),
    );
  }

  _buildIndicator() {
    return SmoothPageIndicator(
        controller: _pageController,
        count: widget.images.length,
        axisDirection: Axis.horizontal,
        effect: ExpandingDotsEffect(
            expansionFactor: 2.sp,
            // spacing: 6.w,
            // radius: 5.r,
            dotWidth: 12.w,
            dotHeight: 12.h,
            // strokeWidth: 88,

            // paintStyle: PaintingStyle.stroke,
            // strokeWidth: 1,
            dotColor: ColorManager.borderInInputTextFiefld,
            activeDotColor: ColorManager.primary));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCompanyFeatures(),
        12.verticalSpace,
        _buildIndicator(),
      ],
    );
  }
}
