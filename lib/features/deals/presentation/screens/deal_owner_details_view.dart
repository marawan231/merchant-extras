import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/available_deals.dart';
import '../widgets/owner_main_details.dart';

import '../../../../core/resources/strings_manager.dart';

class DealOwnerDetailsView extends StatelessWidget {
  const DealOwnerDetailsView({super.key});
  _buildDealOwnerDetailsBody() {
    return ListView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      children: [
        const OwnerMainDetails(),
        SizedBox(height: 32.h),
        const AvailableDeals(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.username),
      ),
      body: _buildDealOwnerDetailsBody(),
    );
  }
}
