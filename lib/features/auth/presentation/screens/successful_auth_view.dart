import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
// import '../../../home/business_logic/home_cubit.dart';

class SuccessfulAuthView extends StatefulWidget {
  const SuccessfulAuthView({super.key});

  @override
  State<SuccessfulAuthView> createState() => _SuccessfulAuthViewState();
}

class _SuccessfulAuthViewState extends State<SuccessfulAuthView> {
  Timer? _timer;

  // void _fetchSliders() {
  //   BlocProvider.of<HomeCubit>(context).getAllSliders();
  // }

  void _startDelay() {
    _timer =
        Timer(const Duration(seconds: AppConstants.goToHomeDelay), _goNext);
  }

  void _goNext() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.mainhomeviewRoute, (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    // _fetchSliders();

    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        ImageAssets.success,
        width: 232.w,
        height: 302.h,
      )),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
