import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/widgets/default_button.dart';
import '../../../../core/resources/utils.dart';
import '../../data/model/deal_model.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/deal_details_card.dart';
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
    return Column(
      children: [
        DealDetailsCard(deal: deal),
        23.verticalSpace,
        Quantity(
            amount: deal.currentUserOrder!.amount!.toString(),
            piecePrice: deal.buyInformation!.price.toString()),
        23.verticalSpace,
        Shipping(
          cityName: deal.currentUserOrder!.country!.name ?? '',
          paymentMethod: 'المحفظة',
        ),
        23.verticalSpace,

        Total(
          total: (deal.buyInformation!.price! * deal.currentUserOrder!.amount!)
              .toString(),
        ),

        // SizedBox(height: 12.h),
        // const Buyer(),
      ],
    );
  }

  _buildStatus(BuildContext context) {
    return DefaultButton(
      text: deal.status == 'complete'
          ? '${getTitle(deal.status!)}   ${'( قيم الصفقة )'}'
          : getTitle(deal.status!),
      onTap: () {
        deal.status == 'complete'
            ? Navigator.pushNamed(context, Routes.rateUsRoute, arguments: {
                'isDealRate': true,
                'dealId': deal.id.toString(),
              })
            : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDealDetailsViewAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
          child: Column(
            children: [
              _buildDealDetailsViewBody(),
              23.verticalSpace,
              _buildStatus(context),
            ],
          ),
        ),
      ),
    );
  }
}
