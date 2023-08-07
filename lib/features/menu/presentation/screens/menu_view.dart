import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import 'package:merchant_extras/features/menu/presentation/widgets/menu_header_widget.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/menu_view_item.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String? avatar;

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBloc(context));
  }

  Widget _buildBloc(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is GetUserInfoSuccess) {
        userImage = state.model.imageUrl ?? '';
        userName = state.model.name ?? '';
        userPhone = state.model.phone ?? '';
        avatar = userImage;
      }
    }, builder: (context, state) {
      return _buildMenuViewBody(context);
    });
  }

  Widget _buildMenuViewBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: MediaQuery.of(context).padding.top + 24.h),
      children: [
        MenuHeaderWidget(avatar: avatar),
        18.heightSpace(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 80.h),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MenuViewItem(
              model: menuList[index],
              index: index,
            );
          },
          itemCount: menuList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 19.h);
          },
        ),
      ],
    );
  }

  _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(AppStrings.menu,
            style: getBoldStyle(fontSize: 20.sp, color: ColorManager.white)),
      ]),
    );
  }
}
