import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_method_item.dart';

class MainAuthView extends StatefulWidget {
  const MainAuthView({super.key});

  @override
  State<MainAuthView> createState() => _MainAuthViewState();
}

class _MainAuthViewState extends State<MainAuthView> {
  bool loading = false;

  List<Widget> _buildAppBarAction(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: InkWell(
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signInAnonymously();
          },
          child: Text(AppStrings.skip,
              style: getBoldStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18.sp)),
        ),
      ),
    ];
  }

  Widget _builMainAuthBody(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h, bottom: 42.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthLogo(),
          SizedBox(height: 41.h),
          _buildMainAuthTitle(context),
          SizedBox(height: 14.h),
          _buildMainAuthSubTitle(context),
          SizedBox(height: 41.h),
          _buildAuthMethods(),
        ],
      ),
    );
  }

  Widget _buildMainAuthTitle(BuildContext context) {
    return Text(
      AppStrings.registerBy,
      style: getBoldStyle(
        fontSize: 30.sp,
        color: ColorManager.black,
      ),
    );
  }

  Widget _buildMainAuthSubTitle(BuildContext context) {
    return Text(
      AppStrings.pleaseChooseMethod,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget _buildAuthMethods() {
    return BlocConsumer<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          // facIdAuthLoading: () => Commons.showLoadingDialog(context),
          facIdAuthSuccess: (uid) {
            BlocProvider.of<AuthCubit>(context).login(uid: uid);
          },
          facIdAuthError: (networkExceptions) {
            // // Navigator.pop(context);
            // Commons.showToast(
            //   color: ColorManager.error,
            //   message: DioExceptionType.getErrorMessage(networkExceptions),
            // );
          },

          firebaseGoogleLoginSuccess: (uid_) {
            uid = uid_;

            BlocProvider.of<AuthCubit>(context).login(uid: uid_);
          },
          firebaseGoogleLoginError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: DioExceptionType.getErrorMessage(networkExceptions),
            );
          },
          loginLoading: () {},
          loginSuccess: (uid) {
            _goToHomeSuccessfully(context);
          },
          loginError: (networkExceptions) {
            if (DioExceptionType.getErrorMessage(networkExceptions) ==
                "not_found") {
              BlocProvider.of<AuthCubit>(context).register(
                  uid: uid!, name: userName, countryId: '1', currencyId: '1');
            } else {
              Commons.showToast(
                color: ColorManager.error,
                message: DioExceptionType.getErrorMessage(networkExceptions),
              );
            }
          },
          registerLoading: () {
            Commons.showLoadingDialog(context);
          },
          registerSuccess: (uid) {
            _goToHomeSuccessfully(context);
          },
          registerError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: DioExceptionType.getErrorMessage(networkExceptions),
            );
          },
          firebaseAnonymousLoginError: (networkExceptions) {
            setState(() => loading = false);

            Commons.showToast(
              color: ColorManager.error,
              message: DioExceptionType.getErrorMessage(networkExceptions),
            );
          },
          firebaseAnonymousLoginLoading: () {
            setState(() => loading = true);
          },
          firebaseAnonymousLoginSuccess: (data) {
            setState(() => loading = false);

            BlocProvider.of<AuthCubit>(context).register(
                uid: data,
                name: 'ضيف',
                email: '',
                phone: '000000000',
                imageUrl:
                    'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/no-profile-picture-icon.png',
                countryId: '1',
                currencyId: '1');
          },
        );
      },
      builder: (context, state) {
        return _buildAuthView();
      },
    );
  }

  _goToHomeSuccessfully(BuildContext context) {
    Commons.showToast(
        color: ColorManager.green, message: AppStrings.loginSuccessfully);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.mainhomeviewRoute, (route) => false);
    // Navigator.pushReplacementNamed(context, Routes.mainhomeviewRoute);
  }

  _buildAuthView() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return _buildSeperatro(index);
        },
        itemCount: authMethods.length,
        itemBuilder: (context, index) {
          return AuthMethodItem(
            leading: authMethods[index].leading,
            title: authMethods[index].title,
            index: index,
          );
        },
      ),
    );
  }

  Widget _buildSeperatro(int index) {
    return index == 1
        ? Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            child: Divider(
              color: ColorManager.dividerColor,
              thickness: 1.sp,
            ),
          )
        : SizedBox(height: 16.h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: _buildAppBarAction(context)),
      body: _builMainAuthBody(context),
    );
  }
}
