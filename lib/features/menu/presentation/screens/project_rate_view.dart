import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
import '../widgets/rate_item.dart';

class ProjectRateView extends StatelessWidget {
  const ProjectRateView({super.key});
  _buildRateUsViewBody() {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 30.h),
      child: ListView(
        children: [
          _buildRatingList(),
          SizedBox(height: 27.h),
          _buildNotesTextField(),
          SizedBox(height: 100.h),
          _buildButton(),
        ],
      ),
    );
  }

  _buildNotesTextField() {
    return CustomTextField(
        contentPadding: EdgeInsets.only(
          top: 79.h,
          right: 20.w,
        ),
        icon: ImageAssets.title,
        title: AppStrings.notes,
        suffix: const Text(''),
        hint: AppStrings.orangeFlibine);
  }

  _buildRatingList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RateItem(
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: 4);
  }

  _buildButton() {
    return const DefaultButton(text: AppStrings.send);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.rateUs)),
      body: _buildRateUsViewBody(),
    );
  }
}
