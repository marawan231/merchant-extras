// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../business_logic/cubit/auth_cubit.dart';

class FaceAuthView extends StatefulWidget {
  const FaceAuthView({super.key});

  @override
  State<FaceAuthView> createState() => _FaceAuthViewState();
}

class _FaceAuthViewState extends State<FaceAuthView> {
  // Future<bool>? isAuth;
  @override
  void initState() {
    super.initState();

    // log(isAuth.toString());
    BlocProvider.of<AuthCubit>(context).facIdAuth();
    // isAuth = LocalAuth.authenticate();

    // log(isAuth.toString());
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 125.h),
      child: Center(
        child: Container(
          width: 161.w,
          height: 161.h,
          decoration: BoxDecoration(
            color: ColorManager.transparent,
            border: Border.all(
              color: ColorManager.cfGrey,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(context),
              SizedBox(height: 27.h),
              _buildTitle(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Text('Face ID',
        style: getBoldStyle(color: ColorManager.grey, fontSize: 26.sp));
  }

  _buildLogo(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushReplacementNamed(context, Routes.successfulAuthViewRoute);
      },
      child: Image.asset(
        ImageAssets.faceId,
        width: 50.w,
        height: 50.h,
        color: ColorManager.primary,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: ColorManager.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildBody(context),
    );
  }
}
