import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
      child: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildData(),
        ],
      ),
    );
  }

  _buildData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadline(),
        SizedBox(height: 15.h),
        _buildContent(),
      ],
    );
  }

  _buildContent() {
    return Text(
      BlocProvider.of<GlobalCubit>(context).privacy,
      style: getRegularStyle(
        fontSize: 13.sp,
        height: 1.5,
        color: ColorManager.black.withOpacity(.6),
      ),
    );
  }

  _buildHeadline() {
    return Text('الشروط و الأحكام',
        style: getMediumStyle(
          fontSize: 18.sp,
          color: ColorManager.black,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.termsAndConditions)),
      body: _buildBody(),
    );
  }
}
