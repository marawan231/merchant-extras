import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/personal_deals.dart';

import '../../../../core/resources/strings_manager.dart';

import '../widgets/my_deals_categories.dart';

class MyDealsMainView extends StatefulWidget {
  const MyDealsMainView({super.key});

  @override
  State<MyDealsMainView> createState() => _MyDealsMainViewState();
}

class _MyDealsMainViewState extends State<MyDealsMainView> {
  @override
  initState() {
    super.initState();
  }

  _buildMyDealsViewBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30.h),
        const MyDealsCategories(),
        SizedBox(height: 15.h),
        _buildSelectedView(),
      ],
    );
  }

  _buildSelectedView() {
    return const PersonalDeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myDeals),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_rounded),
        //   onPressed: () {
        //     BlocProvider.of<GlobalCubit>(context).backToAfterBack(10);
        //   },
        // ),
      ),
      body: _buildMyDealsViewBody(),
    );
  }
}
