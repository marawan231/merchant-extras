import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';

class MenuViewItem extends StatelessWidget {
  const MenuViewItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    // this.onTap,
  });

  final IconData icon;
  final String title;
  final int index;

  // final void Function()? onTap;

  Widget _buildLeading(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: Center(
        child: Icon(
          icon,
          color: ColorManager.white,
          size: 16.sp,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: getBoldStyle(color: ColorManager.black, fontSize: 14.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new,
      size: 20.sp,
      color: index == menuViewItemIcons.length - 1
          ? ColorManager.transparent
          : Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == menuViewItemIcons.length - 1) {
          BlocProvider.of<GlobalCubit>(context).signOut(context);
        } else {
          index == 2
              ? Navigator.pushNamed(context, menuViewItemRoutes[index],
                  arguments: {
                      'isDealRate': false,
                      'dealId' : '0',
                    })
              : Navigator.pushNamed(context, menuViewItemRoutes[index]);
        }
      },
      child: ListTile(
        // selectedTileColor: ColorManager.grey,
        // selected: defaultIndex == index ? true : false,
        // onTap: onTap,
        contentPadding:
            EdgeInsets.only(top: 15.h, right: 15.w, left: 30.w, bottom: 15.h),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.grey.withOpacity(.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        leading: _buildLeading(context),
        title: _buildTitle(),
        trailing: _buildTrailing(context),
      ),
    );
  }
}
