import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/features/home/business_logic/home_cubit.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../deals/business_logic/cubit/deals_cubit.dart';
import '../../../menu/business_logic/cubit/menu_cubit.dart';
import '../../../search/business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/payment_state.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/route_manager.dart';
import '../../business_logic/cubit/payment_cubit.dart';
import '../widgets/ship_to_country.dart';

import '../../../../core/resources/strings_manager.dart';
import '../widgets/payment_methods.dart';
import '../widgets/quantity_to_buy.dart';

// ignore: must_be_immutable
class BuySelectedQuantityView extends StatefulWidget {
  BuySelectedQuantityView(
      {super.key,
      this.quantityFieldVisible,
      required this.totalToPay,
      required this.dealId,
      required this.unitPrice,
      required this.quantity});
  final bool? quantityFieldVisible;
  String? totalToPay;
  final String dealId;
  String quantity;
  String? unitPrice;

  @override
  State<BuySelectedQuantityView> createState() =>
      _BuySelectedQuantityViewState();
}

class _BuySelectedQuantityViewState extends State<BuySelectedQuantityView> {
  @override
  void initState() {
    super.initState();
    log('BuySelectedQuantityView');
    // BlocProvider.of<PaymentCubit>(context).changeTotalToPay(widget.totalToPay!);
    BlocProvider.of<PaymentCubit>(context).quantityToBuy = widget.quantity;
  }

  _buildBody() {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          buyQuantitySuccedded: () {
            log('buyQuantitySuccedded');
            Commons.showToast(
                message: AppStrings.paymentSuccess, color: ColorManager.active);
            // BlocProvider.of<DealsCubit>(context).allDeals == [];

            BlocProvider.of<MenuCubit>(context).getWalletInfo();
            BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(0);
            BlocProvider.of<DealsCubit>(context).getDeals();
            BlocProvider.of<SearchCubit>(context).getAllProducts();
            BlocProvider.of<HomeCubit>(context).getInternationalTopDeals();

            // BlocProvider.of<HomeCubit>(context).;

            Navigator.pushReplacementNamed(context, Routes.successPayViewRoute);
          },
        );
      },
      builder: (context, state) {
        return ListView(
          // shrinkWrap: true,
          padding:
              EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h, bottom: 30.h),
          children: [
            Visibility(
                visible: widget.quantityFieldVisible ?? false,
                child: QuantityToBuy(
                  remainingAmount: widget.quantity,
                  onQuantityChanged: (p0) {
                    if (p0 != '') {
                      widget.totalToPay =
                          (double.parse(p0) * double.parse(widget.unitPrice!))
                              .toString();
                      BlocProvider.of<PaymentCubit>(context)
                          .changeTotalToPay(widget.totalToPay!);
                    } else {
                      widget.totalToPay = '0';
                      BlocProvider.of<PaymentCubit>(context)
                          .changeTotalToPay(widget.totalToPay!);
                    }
                  },
                )),
            // SizedBox(height: 32.h),
            14.verticalSpace,
            const ShipToCountry(),
            14.verticalSpace,

            // SizedBox(height: 36.h),
            PaymentMethods(
              totalToPay: widget.totalToPay,
              onPayTap: () {
                log('choosenCountryId: ${BlocProvider.of<GlobalCubit>(context).choosenCountryId ?? ''}');

                if (widget.totalToPay != '0') {
                  BlocProvider.of<PaymentCubit>(context).buyQuantity(
                    countryId: BlocProvider.of<GlobalCubit>(context)
                            .choosenCountryId ??
                        '1',
                    quantity:
                        BlocProvider.of<PaymentCubit>(context).quantityToBuy,
                    dealId: widget.dealId,
                  );
                } else {
                  if (widget.totalToPay == '0') {
                    log('widget.totalToPay == 0');
                    Commons.showToast(message: AppStrings.quantityNotAvailable);
                  } else if (BlocProvider.of<GlobalCubit>(context)
                          .choosenCountryId ==
                      null) {
                    Commons.showToast(
                        message: AppStrings.pleaseChooseCountryToShip);
                  }
                }
              },
            ),
            // _buildBloc(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.payment),
      ),
      body: _buildBody(),
    );
  }
}
