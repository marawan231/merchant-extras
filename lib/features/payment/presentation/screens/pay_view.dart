import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';

class PayView extends StatefulWidget {
  const PayView({super.key});

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  _buildBody() {
    return ListView(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h, bottom: 30.h),
      children: const [
        // PaymentMethods(),
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
