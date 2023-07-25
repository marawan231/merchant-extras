import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';

import '../../../../core/resources/strings_manager.dart';
import '../widgets/deal_status_view_item.dart';
import '../widgets/order_categories.dart';

 class DealsStatusView extends StatelessWidget {
  const DealsStatusView({super.key});

  _buildSearchResults() {
    return ListView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      children: [
        const OrderCategories(),
        SizedBox(height: 25.h),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const DealsStatusViewItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 12.h);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myDeals),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            BlocProvider.of<GlobalCubit>(context).backTo(10);
          },
        ),
      ),
      body: _buildSearchResults(),
    );
  }
}
