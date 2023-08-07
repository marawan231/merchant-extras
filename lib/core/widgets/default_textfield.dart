import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {super.key,
      this.suffix,
      required this.hint,
      this.contentPadding,
      this.validator,
      this.onSaved,
      this.controller,
      this.onTap,
      this.readOnly,
      this.onChanged,
      this.keyboardType,
      this.hintStyle,
      this.style,
      this.enabled});

  final Widget? suffix;
  final String hint;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool? enabled;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 54.h,
      child: TextFormField(
        enabled: widget.enabled ?? true,
        style: widget.style ??
            getRegularStyle(
              fontSize: 15.sp,
              color: ColorManager.black,
            ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        controller: widget.controller,
        onSaved: widget.onSaved,
        validator: widget.validator,
        decoration: InputDecoration(
          focusedErrorBorder: getInputBorder(),
          disabledBorder: getInputBorder(),
          enabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
          border: getInputBorder(),
          errorBorder: getInputBorder(),
          contentPadding: widget.contentPadding ??
              EdgeInsets.only(top: 18.h, bottom: 18.h, right: 20.w),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              getLightStyle(
                // height: 1.h,
                fontSize: 15.sp,
                color: const Color(0xff919191).withOpacity(.6),
              ),
          suffixIcon: widget.suffix == null
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.only(top: 0.h, left: 20.w),
                  child: widget.suffix,
                ),
        ),
      ),
    );
  }

  InputBorder getInputBorder() {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide:
          BorderSide(color: ColorManager.borderInInputTextFiefld, width: 1.w),
    );
    return inputBorder;
  }
}
