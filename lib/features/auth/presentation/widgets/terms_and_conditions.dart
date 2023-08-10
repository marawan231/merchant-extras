import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isCheck = true;
  _buildCheckBox() {
    return Checkbox(
      value: isCheck,
      onChanged: (value) {
        setState(() {
          isCheck = value!;
        });
      },
      activeColor: ColorManager.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCheckBox(),
        // 0.horizontalSpace,

        Text(
          AppStrings.agreeTo,
          style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 14.sp),
        ),
        2.horizontalSpace,
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
          },
          child: Text(AppStrings.termsAndConditions,
              style: getRegularStyle(
                  color: ColorManager.primary, fontSize: 14.sp)),
        ),

        // RichText(
        //   text: TextSpan(children: [
        //     TextSpan(
        //         text: AppStrings.agreeTo,
        //         style: getRegularStyle(
        //             color: ColorManager.darkGrey, fontSize: 14.sp)),
        //     WidgetSpan(child: SizedBox(width: 5.w)),
        //     //i want this widget to be clickable

        //     TextSpan(

        //         text: AppStrings.termsAndConditions,
        // style: getRegularStyle(
        //     color: ColorManager.green, fontSize: 14.sp)),

        //   ]),
        // ),
      ],
    );
  }
}
