import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';

import 'default_textfield.dart';
import 'headline.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.icon,
      required this.title,
      this.suffix,
      required this.hint,
      this.contentPadding,
      this.iconHeight,
      this.iconWidth,
      this.validator,
      this.onSaved,
      this.controller,
      this.onTap,
      this.readOnly,
      this.onChanged,
      this.keyboardType});

  final String? icon;
  final String title;
  final Widget? suffix;
  final String hint;
  final double? iconHeight;
  final double? iconWidth;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String?)? onSaved;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  _buildPhoneTextField() {
    return Column(
      children: [
        Headline(
          textColor: ColorManager.black,
          title: title,
          icon: icon,
          iconHeight: iconHeight,
          iconWidth: iconWidth,
        ),
        SizedBox(height: 15.h),
        _buildInputField(),
      ],
    );
  }

  _buildInputField() {
    return DefaultTextField(
    
      keyboardType: keyboardType,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      controller: controller,
      onSaved: onSaved,
      suffix: suffix,
      hint: hint,
    
      onTap: onTap,
      contentPadding: contentPadding,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhoneTextField();
  }
}
