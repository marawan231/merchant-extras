import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/ship_to_country.dart';

import '../../../../core/resources/strings_manager.dart';

class BuyDetailsView extends StatefulWidget {
  const BuyDetailsView({super.key});

  @override
  State<BuyDetailsView> createState() => _BuyDetailsViewState();
}

class _BuyDetailsViewState extends State<BuyDetailsView> {
  _buildBody() {
    return ListView(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h, bottom: 30.h),
      children: [
        const ShipToCountry(),
        SizedBox(height: 36.h),
        // const PaymentMethods(),
      ],
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
