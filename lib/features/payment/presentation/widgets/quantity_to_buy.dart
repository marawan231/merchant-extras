import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_textfield.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class QuantityToBuy extends StatelessWidget {
  const QuantityToBuy({super.key, this.onQuantityChanged});
  final void Function(String)? onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        keyboardType: TextInputType.number,
        onChanged: onQuantityChanged,
        icon: ImageAssets.weight,
        iconHeight: 16.sp,
        iconWidth: 16.sp,
        title: AppStrings.quantityToBuy,
        suffix: const Text(
          '',
        ),
        hint: '3 kg');
  }
}
