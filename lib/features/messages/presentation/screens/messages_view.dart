import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/messages_categories.dart';

import '../widgets/deals_list.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  _buildMessagesViewBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: ListView(
        children: [
          const MessagesCategories(),
          SizedBox(height: 20.h),
          const DealsList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // appBar: defaultAppBar(context, title: AppStrings.messages),
        _buildMessagesViewBody();
  }
}
