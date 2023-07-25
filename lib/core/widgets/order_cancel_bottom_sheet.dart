import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

import 'bottom_sheet_item.dart';

class OrderCancelBottomSheet extends StatelessWidget {
  const OrderCancelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          // isDefaultAction: true,
          onPressed: () {},
          child: const BottomSheetItem(title: AppStrings.onRoad, choosen: true),
        ),
        CupertinoActionSheetAction(
          // isDefaultAction: true,
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return const OrderCancelBottomSheet();
              },
            );
          },
          child: const BottomSheetItem(title: AppStrings.orderCancel),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: Text(
          AppStrings.cancel,
          style: getBoldStyle(
              color: Theme.of(context).primaryColor, fontSize: 18.sp),
        ),
        // isDestructiveAction: true,
      ),
    );
  }
}
