import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});
  _buildEditButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.editProfileRoute);
      },
      child: Container(
        width: 35.w,
        height: 35.h,
        // radius: 35.r,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(35.r),
        ),
        child: Icon(
          FontAwesomeIcons.penToSquare,
          color: Theme.of(context).primaryColor,
          size: 12.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildEditButton(context);
  }
}
