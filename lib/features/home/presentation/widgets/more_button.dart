// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/resources/utils.dart';
// import '../../../../core/resources/commons.dart';

// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/resources/strings_manager.dart';
// import '../../../../core/resources/style_manager.dart';

// class MoreButton extends StatelessWidget {
//   const MoreButton({super.key, required this.index, required this.urlLink});

//   final int index;
//   final String urlLink;

//   _buildMoreButton(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Commons.openUrl(urlLink);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
//         decoration: BoxDecoration(
//             color: index == 0
//                 ? ColorManager.white
//                 : Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.all(Radius.circular(5.r))),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildMoreText(context),
//             24.widthSpace(),
//             _buildMoreButtonArrow(context),
//           ],
//         ),
//       ),
//     );
//   }

//   _buildMoreText(BuildContext context) {
//     return Text(
//       AppStrings.more,
//       style: getRegularStyle(
//           color:
//               index == 0 ? Theme.of(context).primaryColor : ColorManager.white,
//           fontSize: 10.sp),
//     );
//   }

//   _buildMoreButtonArrow(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 4.h),
//       child: Icon(
//         Icons.arrow_back_ios_new,
//         color: index == 0 ? Theme.of(context).primaryColor : ColorManager.white,
//         size: 8.sp,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildMoreButton(context);
//   }
// }
