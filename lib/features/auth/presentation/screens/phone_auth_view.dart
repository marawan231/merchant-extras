import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/assets_manager.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/style_manager.dart';
import '../../../../core/resources/constants.dart';
import '../widgets/phone_auth_textfiield.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/auth_logo.dart';
import '../widgets/terms_and_conditions.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  bool loading = false;

  final TextEditingController _phoneController = TextEditingController();

  @override
  initState() {
    // _phoneController.text = '01007507317';
    super.initState();
  }

  _buildPhoneAuthBody(BuildContext context) {
    return Form(
      key: _phoneFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w, bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              Center(
                  child: AuthLogo(image: ImageAssets.phoneAuth, height: 274.h)),
              SizedBox(height: 42.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPhoneAuthTitle(context),
                    SizedBox(height: 8.h),
                    _buildPhoneAuthSubTitle(context),
                  ],
                ),
              ),
              SizedBox(height: 19.h),
              _buildPhoneTextField(),
              SizedBox(height: 12.h),
              const TermsAndConditions(),
              SizedBox(height: 15.h),
              _buildBottomButton(context),
              _buildPhoneNumberSubmitedBloc(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPhoneTextField() {
    return PhoneAuthTextField(controller: _phoneController);
  }

  _buildPhoneAuthTitle(BuildContext context) {
    return Text(AppStrings.authWithPhone,
        style: getBoldStyle(fontSize: 30.sp, color: ColorManager.black));
  }

  _buildPhoneAuthSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.w),
      child: Text(
          // textAlign: TextAlign.center,
          AppStrings.phoneAuthSubtitle,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }

  _buildBottomButton(BuildContext context) {
    return DefaultButton(
      isLoading: loading,
      text: AppStrings.login,
      onTap: () {
        _register(context);
      },
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Commons.showToast(message: AppStrings.invalidNumber);
      return;
    } else {
      setState(() => loading = true);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context).submitPhoneNumber(
          phoneCode: dialCode, phoneNumber: _phoneController.text);
    }
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          phoneAuthLoading: () {
            loading = true;
          },
          phoneNumberSubmited: () {
            loading = false;

            Navigator.of(context).pushNamed(Routes.confirmPhoneViewRoute,
                arguments: _phoneController.text);
          },
          phoneAuthErrorOccurred: (errorMsg) {
            loading = false;
            Commons.showToast(message: errorMsg);
          },
        );
      },
      child: const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildPhoneAuthBody(context),
    );
  }
}
