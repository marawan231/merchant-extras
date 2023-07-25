import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/shared_prefrences.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_state.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/business_logic/cubit/global_state.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../deals/presentation/widgets/edit_button.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../widgets/menu_view_item.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBloc(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          getUserInfoSuccess: (user) {
            userImage = user.imageUrl ?? '';
            userName = user.name ?? 'اسم المستخدم';
            userPhone = user.phone ?? '';
          },
        );
      },
      builder: (context, state) {
        return _buildMenuViewBody(context);
      },
    );
  }

  Widget _buildMenuViewBody(BuildContext context) {
    return ListView(
      children: [
        _buildProfileItem(context),
        BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {
            state.whenOrNull(
              logOutSuccess: () {
                CacheHelper.removeAll();

                token = null;
                screenIndex = 0;
                BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(0);
                Commons.showToast(
                  message: AppStrings.logOutMessage,
                  color: ColorManager.green,
                );
                Navigator.pushReplacementNamed(context, Routes.splashRoute);
              },
            );
          },
          builder: (context, state) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                    right: 20.w, left: 20.w, top: 20.h, bottom: 80.h),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MenuViewItem(
                    icon: menuViewItemIcons[index],
                    title: menuViewItemTitles[index],
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15.h);
                },
                itemCount: menuViewItemIcons.length);
          },
        ),
      ],
    );
  }

  _buildProfileItem(context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: ColorManager.grey.withOpacity(.10),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 15.w),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                    width: 55.w,
                    height: 55.h,
                    child: CustomNetworkCachedImage(url: userImage)),
              ),
              SizedBox(width: 12.w),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      userName,
                      style: getBoldStyle(
                          fontSize: 15.sp, color: ColorManager.black),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_in_talk,
                          size: 12.sp,
                          color: ColorManager.primary,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          userPhone,
                          style: getRegularStyle(
                              fontSize: 12.sp, color: ColorManager.darkGrey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const EditButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc(context);
  }
}
