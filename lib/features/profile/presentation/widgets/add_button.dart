import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  _buildAddButton(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration:
          BoxDecoration(color: ColorManager.lightWhite, shape: BoxShape.circle),
      child: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
        size: 18.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAddButton(context);
  }
}
