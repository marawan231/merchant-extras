import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/assets_manager.dart';
import 'package:merchant_extras/core/resources/route_manager.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import 'package:merchant_extras/features/menu/data/models/menu_model.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/constants.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class MenuViewItem extends StatelessWidget {
  const MenuViewItem({
    super.key,
    required this.index,
    required this.model,
    // this.onTap,
  });

  final int index;
  final MenuModel model;

  // final void Function()? onTap;

  Widget _buildLeading(BuildContext context) {
    return Center(
      child: Image.asset(
        model.icon,
        color: index == 6 ? ColorManager.red : ColorManager.primary,
        height: 20.w,
        width: 24.w,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Text(
        model.title,
        style: getRegularStyle(color: ColorManager.black, fontSize: 15.sp),
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Image.asset(
      ImageAssets.arrowBackIos,
      height: 16.w,
      width: 9.w,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onItemTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: ColorManager.lightWhite,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(children: [
          _buildLeading(context),
          18.widthSpace(),
          _buildTitle(),
          _buildTrailing(context),
        ]),
      ),
    );
  }

  void _onItemTap(context) {
    switch (index) {
      case 0:
      case 1:
        Navigator.pushNamed(context, menuList[index].route!);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.rateUsRoute, arguments: {
          'isDealRate': false,
          'dealId': '',
        });
        break;
      case 3:
        Navigator.pushNamed(context, Routes.contactUsRoute);
        break;
      case 4:
        Navigator.pushNamed(context, Routes.whoAreUsRoute);
        break;
      case 5:
        Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
        break;
      case 6:
        BlocProvider.of<GlobalCubit>(context).signOut(context);
        break;
    }
  }
}
