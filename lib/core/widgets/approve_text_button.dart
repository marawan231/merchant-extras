import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

class ApproveTextButton extends StatelessWidget {
  const ApproveTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print('pressed');
      },
      child: Text(
        AppStrings.approve,
        style:
            getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 17.sp)
                .copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
