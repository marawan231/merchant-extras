import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/personal_deals.dart';


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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          const MyDealsCategories(),
          SizedBox(height: 15.h),
          _buildSelectedView(),
          90.horizontalSpace,
        ],
      ),
    );
  }

  _buildSelectedView() {
    return const PersonalDeals();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMyDealsViewBody();
  }
}
