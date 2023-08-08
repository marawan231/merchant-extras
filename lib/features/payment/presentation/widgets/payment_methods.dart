import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/route_manager.dart';
import '../../business_logic/cubit/payment_cubit.dart';
import '../../business_logic/cubit/payment_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../menu/business_logic/cubit/menu_cubit.dart';
import 'pay_method_item.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, required this.onPayTap, this.totalToPay});
  final void Function()? onPayTap;
  final String? totalToPay;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PaymentCubit>(context).changeTotalToPay(widget.totalToPay!);
  }

  _buildHeadline() {
    return Text(
      AppStrings.paymentMethod.replaceAll(':', ''),
      style: getBoldStyle(color: ColorManager.black, fontSize: 17.sp),
    );
  }

  _buildPayMethodList() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PayMethodItem(
              onTap: () {
                setState(() {
                  payMethodDefaultIndex = index;
                });
              },
              leading: Image.asset(
                buyDetailesIcons[index],
                width: 50.w,
                height: 50.h,
                // fit: BoxFit.contain,
                // payMethodDefaultIndex = index;
                color: index == 0
                    ? payMethodDefaultIndex == index
                        ? Theme.of(context).primaryColor
                        : ColorManager.grey
                    : null,
              ),
              title: buyDetailesTitles[index],
              index: index,
              onArrowTap: (() {
                setState(() {
                  payMethodDefaultIndex = index;
                });
              }));
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: buyDetailesTitles.length);
  }

  // Widget _buildCurrentFund() {
  //   return BlocProvider.value(
  //     value: RouteGenerator.menuCubit,
  //     child: RichText(
  //         text: TextSpan(
  //       children: [
  //         TextSpan(
  //             text: AppStrings.currentMoneyInWallet,
  //             style:
  //                 getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp)),
  //         TextSpan(
  //             text: ' \$ ${BlocProvider.of<MenuCubit>(context).currentBalance}',
  //             style: getBoldStyle(
  //                 color: Theme.of(context).primaryColor, fontSize: 15.sp))
  //       ],
  //     )),
  //   );
  // }

  _buildTotal() {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {},
      // buildWhen: (previous, current) => current is ChangeTotalToPaySuccedded,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildValuetTotal(),
          changeTotalToPaySuccedded: (totalToPay) => _buildValuetTotal(),
        );
      },
    );

    // RichText(
    //     text: TextSpan(
    //   children: [
    //     TextSpan(
    //         text: AppStrings.totla,
    //         style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 17.sp)),
    //     TextSpan(
    //         text: ' \$ ${widget.totalToPay}',
    //         style: getBoldStyle(
    //             color: Theme.of(context).primaryColor, fontSize: 25.sp))
    //   ],
    // ));
  }

  _buildValuetTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.totla.replaceAll(':', ''),
          style: getMediumStyle(color: ColorManager.black, fontSize: 24.sp),
        ),
        // 10.horizontalSpace,

        Text(
          ' \$ ${BlocProvider.of<PaymentCubit>(context).totalToPayV}',
          style: getMediumStyle(
              color: Theme.of(context).primaryColor, fontSize: 24.sp),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadline(),
            14.verticalSpace,
            // SizedBox(height: 20.h),
            _buildPayMethodList(),
          ],
        ),
        // SizedBox(height: 0.h),
        Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            8.verticalSpace,
            _buildTotal(),
            SizedBox(height: 57.h),
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return DefaultButton(
                  isLoading: state is BuyQuantityLoading ? true : false,
                  text: AppStrings.pay,
                  onTap: widget.onPayTap,

                  // },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
