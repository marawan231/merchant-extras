import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      this.readOnly, this.onChanged, this.keyboardType});

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
  

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 14.h, bottom: 13.h, right: 20.w),
        hintText: widget.hint,
        suffixIcon: widget.suffix == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(top: 0.h, left: 20.w),
                child: widget.suffix,
              ),
      ),
    );
  }
}
