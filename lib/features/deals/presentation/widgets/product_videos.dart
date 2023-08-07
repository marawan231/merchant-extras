import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../profile/presentation/widgets/add_button.dart';
import '../../../profile/presentation/widgets/close_button.dart';

class ProductVideos extends StatelessWidget {
  const ProductVideos({super.key});

  //todo refactor headline to seperate Widget

  _buildCertificates() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        const AddButton(),
        SizedBox(width: 15.w),
        const VideoItem(),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCertificates();
  }
}

class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136.w,
      height: 85.h,
      child: Stack(
        children: [
          Image.asset(
            ImageAssets.productImage,
            // fit: BoxFit.fill,
          ),
          const CustomCloseButton(),
        ],
      ),
    );
  }
}
