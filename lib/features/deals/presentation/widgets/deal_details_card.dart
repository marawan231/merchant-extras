import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/model/deal_model.dart';

class DealDetailsCard extends StatelessWidget {
  const DealDetailsCard({super.key, required this.deal});
  final DealModel deal;

  _buildDealStatus() {
    return Text(
      getTitle(deal.status ?? 'active'),
      style: getRegularStyle(
          color: getStatusColor(deal.status ?? ''), fontSize: 14.sp),
    );
  }

  _buildDealNumber() {
    return Text(
      '${AppStrings.orderNumber} ${deal.id}',
      style: getRegularStyle(color: ColorManager.black, fontSize: 15.sp),
    );
  }

  _buildDealTitle() {
    return Text(
      deal.name ?? '',
      style: getBoldStyle(color: ColorManager.black, fontSize: 20.sp),
    );
  }

  _buildImage() {
    return SizedBox(
      width: double.infinity,
      height: 128.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CustomNetworkCachedImage(
          url: deal.images![0].attachmentUrl!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDealNumber(),
            _buildDealStatus(),
          ],
        ),
        12.heightSpace(),
        _buildDealTitle(),
        23.heightSpace(),
        _buildImage(),
      ],
    );
  }
}
