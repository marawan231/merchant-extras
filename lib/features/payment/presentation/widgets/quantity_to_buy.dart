import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import 'package:merchant_extras/features/payment/data/model/choice_model.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_textfield.dart';
import '../../business_logic/cubit/payment_cubit.dart';

class QuantityToBuy extends StatefulWidget {
  const QuantityToBuy(
      {super.key, this.onQuantityChanged, this.remainingAmount});
  final void Function(String)? onQuantityChanged;
  final String? remainingAmount;

  @override
  State<QuantityToBuy> createState() => _QuantityToBuyState();
}

class _QuantityToBuyState extends State<QuantityToBuy> {
  List<ChoiceModel> choices = [
    ChoiceModel(id: 1, title: AppStrings.buyRemainingQuantity),
    ChoiceModel(id: 2, title: AppStrings.buySelectedQuantity),
  ];
  ChoiceModel? selectedChoice;
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedChoice = choices[0];
  }

  _buildBuyChoice() {
    // log('choices: $choices');
    return SizedBox(
      width: 194.w,
      // height: 54.h,
      child: DropdownButtonFormField(
        // itemHeight: 200,
        // menuMaxHeight: 299,
        isExpanded: true,

        // isDense: true,
        dropdownColor: ColorManager.lightWhite,
        alignment: Alignment.centerRight,
        focusColor: ColorManager.lightWhite,
        iconEnabledColor: ColorManager.seventyGrey,

        // isDense: true,
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        // borderRadius: BorderRadius.all(Radius.circular(10.r)),
        style: getRegularStyle(fontSize: 15.sp, color: ColorManager.black),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.h, horizontal: 22.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(
              width: 1.sp,
              color: ColorManager.borderInInputTextFiefld,
            ),
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16.w,
            color: ColorManager.seventyGrey,
          ),
        ),
        value: selectedChoice!.title,
        items: choices
            .map((e) => DropdownMenuItem(
                  value: e.title,
                  child: Text(
                    e.title ?? '',
                    style: getRegularStyle(
                        fontSize: 15.sp, color: ColorManager.black),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          // print(value);
          setState(() {
            selectedChoice =
                choices.firstWhere((element) => element.title == value);
          });
        },
      ),
    );
  }

  _buildTitle() {
    return Text(
      'الكمية المطلوبة',
      style: getBoldStyle(fontSize: 17.sp, color: ColorManager.black),
    );
  }

  _buildQuantityTextField() {
    return Expanded(
      child: DefaultTextField(
        enabled: selectedChoice!.id == 1 ? false : true,

        hintStyle: getMediumStyle(fontSize: 15.sp, color: ColorManager.black),
        controller: _quantityController,
        hint:
            selectedChoice!.id == 1 ? '${widget.remainingAmount!} قطعة' : '0.0',
        keyboardType: TextInputType.number,
        onChanged: (value) {
          widget.onQuantityChanged!(value);
          BlocProvider.of<PaymentCubit>(context).quantityToBuy = value;
        },
        // icon: ImageAssets.weight,
        // iconHeight: 16.sp,
        // iconWidth: 16.sp,
        // title: ,
        suffix: const Text(
          '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        15.verticalSpace,
        Row(
          children: [
            _buildBuyChoice(),
            7.horizontalSpace,
            _buildQuantityTextField(),
          ],
        ),
      ],
    );
  }
}
