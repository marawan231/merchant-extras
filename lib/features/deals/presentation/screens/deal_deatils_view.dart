import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils.dart';
import '../../data/model/deal_model.dart';
import '../../../../core/resources/route_manager.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/floating_container.dart';
import '../widgets/deal_details_card.dart';
import '../widgets/kilo_price_payment.dart';
import '../widgets/quantity.dart';
import '../widgets/shipping.dart';
import '../widgets/total.dart';

class DealDetailsView extends StatelessWidget {
  const DealDetailsView({super.key, required this.deal});
  final DealModel deal;
  _buildDealDetailsViewAppBar(BuildContext context) {
    return AppBar(
      title: const Text(AppStrings.dealDetails),
      actions: const [
        // Padding(
        //   padding: EdgeInsets.only(left: 20.w),
        //   child: InkWell(
        //     onTap: () {
        //       showCupertinoModalPopup(
        //         barrierColor: ColorManager.black.withOpacity(.8),
        //         context: context,
        //         builder: (context) {
        //           return const MyActionSheet();
        //         },
        //       );
        //     },
        //     child: Icon(
        //       Icons.settings,
        //       color: ColorManager.black,
        //       size: 18.sp,
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _buildDealDetailsViewBody() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      child: Column(
        children: [
          DealDetailsCard(
            deal: deal,
          ),
          SizedBox(height: 30.h),
          Total(
            total:
                (deal.buyInformation!.price! * deal.currentUserOrder!.amount!)
                    .toString(),
          ),
          SizedBox(height: 12.h),
          KiloPriceAndPayment(
            kiloPrice: deal.buyInformation!.price.toString(),
            paymentMethod: 'المحفظة',
          ),
          SizedBox(height: 12.h),
          Quantity(
            amount: deal.currentUserOrder!.amount!.toString(),
          ),
          SizedBox(height: 12.h),
          Shipping(
            cityName: deal.currentUserOrder!.country!.name ?? '',
          ),
          // SizedBox(height: 12.h),
          // const Buyer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDealDetailsViewAppBar(context),
      body: Stack(
        children: [
          _buildDealDetailsViewBody(),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingContainer(
                width: 178.w,
                height: 36.h,
                title: deal.status == 'complete'
                    ? '${getTitle(deal.status!)}   ${'( قيم الصفقة )'}'
                    : getTitle(deal.status!),
                ontap: () {
                  deal.status == 'complete'
                      ? Navigator.pushNamed(context, Routes.rateUsRoute,
                          arguments: {
                              'isDealRate': true,
                              'dealId': deal.id.toString(),
                            })
                      : null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
