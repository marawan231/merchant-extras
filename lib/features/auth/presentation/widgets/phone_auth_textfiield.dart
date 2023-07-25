import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_country_code/codes.dart';
import 'custom_country_code/custome_country_picker.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';

class PhoneAuthTextField extends StatelessWidget {
  const PhoneAuthTextField(
      {super.key, required this.controller, this.validator});

  final TextEditingController controller;
  final String? Function(String?)? validator;

  _buildPhoneTextField() {
    return CustomTextField(
        keyboardType: TextInputType.number,
        validator: validator,
        controller: controller,
        icon: ImageAssets.viber,
        title: AppStrings.phoneNumber,
        suffix: CustomCountryPicker(
            onChanged: (code) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
              dialCode = code.dialCode ?? '+966';
              countryCode = code.code ?? 'SA';
            },
            onInit: (code) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            },
            favorite: const ['+966', 'SA'],
            initialSelection: '+966',
            showCountryOnly: false,
            countryList: supportedCodes,
            showOnlyCountryWhenClosed: false,
            // countryFilter: const ['SA', 'EG'],
            flagWidth: 24.w,
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: ColorManager.textDarkColor,
                fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignLeft: false),
        hint: userPhone);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhoneTextField();
  }
}
