import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';

class UserNameDialog {
  static void show(
      {required BuildContext context,
      required Key formKey,
      required TextEditingController userNameController,
      required Function onRegisterTap}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            insetPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      icon: ImageAssets.user,
                      title: AppStrings.name,
                      controller: userNameController,
                      hint: AppStrings.username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.pleaseEnterTheName;
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextButton(
                        onPressed: () => onRegisterTap(),
                        child: Text(AppStrings.register,
                            style: getBoldStyle(
                                color: ColorManager.primary, fontSize: 16.sp))),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
