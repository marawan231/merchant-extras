import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';

import '../../../../core/resources/strings_manager.dart';
import '../widgets/shipping_address.dart';

class TamweelPayView extends StatefulWidget {
  const TamweelPayView({super.key});

  @override
  State<TamweelPayView> createState() => _TamweelPayViewState();
}

class _TamweelPayViewState extends State<TamweelPayView> {
  _buildBody() {
    return ListView(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h, bottom: 30.h),
      children: [
        _buildAmountTextField(),
        SizedBox(height: 32.h),
        const ShippmentAdress(),
        SizedBox(height: 32.h),
        // const PaymentMethods(),
      ],
    );
  }

  _buildAmountTextField() {
    return CustomTextField(
        contentPadding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 20.w),
        icon: ImageAssets.weight,
        title: AppStrings.wantedQuantity,
        suffix: const Text(''),
        hint: AppStrings.thousand + AppStrings.kilo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.buyDetails),
      ),
      body: _buildBody(),
    );
  }
}
