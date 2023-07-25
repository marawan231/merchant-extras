import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/business_logic/cubit/global_cubit.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class WhoAreUsView extends StatefulWidget {
  const WhoAreUsView({super.key});

  @override
  State<WhoAreUsView> createState() => _WhoAreUsViewState();
}

class _WhoAreUsViewState extends State<WhoAreUsView> {
  _buildWhoAreUsViewBody() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
      child: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogo(),
          SizedBox(height: 33.h),
          _buildBody(),
        ],
      ),
    );
  }

  _buildBody() {
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
      BlocProvider.of<GlobalCubit>(context).aboutUs,
      style: getRegularStyle(
        fontSize: 13.sp,
        color: ColorManager.black.withOpacity(.6),
      ),
    );
  }

  _buildHeadline() {
    return Text('من نحن :',
        style: getBoldStyle(
          fontSize: 18.sp,
          color: ColorManager.primary,
        ));
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.splashLogo,
      width: 117.w,
      height: 109.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.whoAreUs)),
      body: _buildWhoAreUsViewBody(),
    );
  }
}
