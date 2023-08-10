import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).priceFrom = 0;
    BlocProvider.of<SearchCubit>(context).priceTo = 10000;
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        10.verticalSpace,
        _buildSlider(),
      ],
    );
  }

  _buildSlider() {
    return FlutterSlider(
      rtl: true,
      values: [
        BlocProvider.of<SearchCubit>(context).priceFrom ?? 0,
        BlocProvider.of<SearchCubit>(context).priceTo ?? 10000
      ],
      rangeSlider: true,

      max: 10000,
      min: 0,
      onDragging: (handlerIndex, lowerValue, upperValue) {
        BlocProvider.of<SearchCubit>(context).priceFrom = lowerValue;
        BlocProvider.of<SearchCubit>(context).priceTo = upperValue;
        log('lowerValue $lowerValue');
        log(BlocProvider.of<SearchCubit>(context).priceFrom.toString());
        log('upperValue $upperValue');
        log(BlocProvider.of<SearchCubit>(context).priceTo.toString());
        // log('handlerIndex $handlerIndex');
      },
      // step: 1,
      trackBar: FlutterSliderTrackBar(
        activeTrackBarHeight: 2.5,
        inactiveTrackBarHeight: 1,
        inactiveTrackBar: BoxDecoration(color: ColorManager.grey),
        activeTrackBar: BoxDecoration(color: ColorManager.primary),
      ),
      handlerHeight: 20.w,
      handlerWidth: 20.w,
      rightHandler: handler(),
      handler: handler(),
      tooltip: FlutterSliderTooltip(
        textStyle: getBoldStyle(color: ColorManager.black, fontSize: 15.sp),

        boxStyle: const FlutterSliderTooltipBox(
            decoration: BoxDecoration(color: Colors.white)),
        alwaysShowTooltip: true,
        positionOffset: FlutterSliderTooltipPositionOffset(top: 30.h),
        // disabled: true,
      ),
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.requiredPrice,
      style: getBoldStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }

  handler() {
    return FlutterSliderHandler(
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: ColorManager.primary, width: 1.w))),
    );
  }
}
