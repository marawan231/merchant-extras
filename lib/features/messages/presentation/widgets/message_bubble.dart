import 'package:bubble/bubble.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../deals/presentation/widgets/custom_deal_detail_container.dart.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    this.message = '',
    this.date,
    required this.isMe,
    Key? key,
    required this.index,
  }) : super(key: key);

  final String message;
  final String? date;
  final bool isMe;
  final int index;

  Widget _buildOfferContainer(BuildContext context) {
    return Bubble(
      shadowColor: ColorManager.transparent,
      nipOffset: 10.sp,
      radius: Radius.circular(10.r),
      padding: BubbleEdges.only(top: 15.h, bottom: 13.h),
      alignment: Alignment.topRight,
      nipWidth: 10.w,
      nipHeight: 10.h,
      nipRadius: .4.r,
      nip: BubbleNip.rightTop,
      color: ColorManager.grey.withOpacity(.10),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadline(),
            SizedBox(height: 11.h),
            _buildProductTitle(context),
            SizedBox(height: 25.h),
            _buildProductDetailes(context),
            SizedBox(height: 30.h),
            DefaultButton(
              text: AppStrings.pay,
              widht: 210.w,
              // height: 37.h,
            ),
            SizedBox(height: 11.h),
            _buildTime(),
          ],
        ),
      ),
    );
  }

  _buildProductDetailes(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          CustomDealDetailContainer(
            iconWidth: 12.w,
            iconHeight: 12.h,
            titleTextStyle:
                getBoldStyle(color: ColorManager.darkGrey, fontSize: 8.sp),
            color: ColorManager.white,
            width: 102.w,
            height: 53.h,
            title: AppStrings.kiloPrice,
            value: Text(
              '1.5 \$',
              style: getBoldStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 13.sp,
              ),
            ),
            icon: ImageAssets.priceTag,
          ),
          SizedBox(width: 6.w),
          CustomDealDetailContainer(
            iconWidth: 12.w,
            iconHeight: 12.h,
            titleTextStyle:
                getBoldStyle(color: ColorManager.darkGrey, fontSize: 8.sp),
            color: ColorManager.white,
            width: 102.w,
            height: 53.h,
            title: AppStrings.quantity,
            value: Text(
              '500 كيلو',
              style: getBoldStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 13.sp,
              ),
            ),
            icon: ImageAssets.weight,
          ),
        ],
      ),
    );
  }

  _buildHeadline() {
    return Text(
      AppStrings.newOfferAdded,
      style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 14.sp),
    );
  }

  _buildProductTitle(BuildContext context) {
    return Text(
      AppStrings.resultTitle,
      style:
          getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 12.sp)
              .copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _buildMessageContainer(BuildContext context) {
    return Bubble(
      shadowColor: ColorManager.transparent,
      nipOffset: 10.sp,
      radius: Radius.circular(10.r),
      padding: BubbleEdges.only(top: 15.h, bottom: 13.h),
      alignment: Alignment.topRight,
      nipWidth: 10.w,
      nipHeight: 10.h,
      nipRadius: .4.r,
      nip: isMe ? BubbleNip.leftTop : BubbleNip.rightTop,
      color: isMe
          ? Theme.of(context).primaryColor
          : ColorManager.grey.withOpacity(.10),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w, left: 15.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isMe ? _buildTime() : _buildMessageText(),
            SizedBox(width: 18.w),
            isMe ? _buildMessageText() : _buildTime(),
          ],
        ),
      ),
    );
  }

  _buildTime() {
    return Text(
      '4:00 am',
      textAlign: TextAlign.right,
      style: getRegularStyle(
          color: isMe
              ? ColorManager.white.withOpacity(.70)
              : ColorManager.darkGrey.withOpacity(.70),
          fontSize: 10.sp),
    );
  }

  _buildMessageText() {
    return Text(
      'Hello, World!',
      textAlign: TextAlign.right,
      style: getRegularStyle(
          color: isMe ? ColorManager.white : ColorManager.darkGrey,
          fontSize: 14.sp),
    );
  }

  _buildTransalationButton() {
    return Padding(
      padding: EdgeInsets.only(left: isMe ? 23.w : 0, right: isMe ? 0.w : 23.w),
      child: Text(
        AppStrings.showTranslate,
        style: getRegularStyle(color: ColorManager.black, fontSize: 10.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            index == 0
                ? _buildOfferContainer(context)
                : _buildMessageContainer(context),
            SizedBox(height: 9.h),
            _buildTransalationButton(),
          ],
        ),
      ],
    );
    // _buildMessageTime(),
  }
}
