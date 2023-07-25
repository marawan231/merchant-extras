import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/utils.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return _buildSearchField(context);
  }

  _buildSearchField(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(1);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSearchIcon(context),
            10.widthSpace(),
            _buildSearchText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    return Image.asset(
      ImageAssets.homeSearch,
      color: ColorManager.black,
      height: 20.w,
      width: 20.w,
    );
  }

  Widget _buildSearchText(BuildContext context) {
    return Text(
      AppStrings.search,
      style: getRegularStyle(color: ColorManager.black, fontSize: 14.sp),
    );
  }
}
