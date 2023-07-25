import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/shared_prefrences.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../widgets/user_name_dialog.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../../business_logic/cubit/auth_state.dart';
import '../widgets/counter_down.dart';
import '../widgets/pin_code_fields.dart';
import '../widgets/resend_code.dart';

class ConfirmPhoneView extends StatefulWidget {
  const ConfirmPhoneView({
    super.key,
  });

  @override
  State<ConfirmPhoneView> createState() => _ConfirmPhoneViewState();
}

class _ConfirmPhoneViewState extends State<ConfirmPhoneView> {
  String? enteredOtpCode = '000000';

  bool loading = false;

  TextEditingController userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildConfirmPhoneViewBody(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      children: [
        _buildConfirmPhoneViewHeadline(context),
        SizedBox(height: 12.h),
        _buildConfirmPhoneViewSubTitle(context),
        SizedBox(height: 40.h),
        _buildOtpCodeTextField(),
        SizedBox(height: 82.h),
        _buildRemainingTime(),
        SizedBox(height: 82.h),
        const ResendCode(),
        SizedBox(height: 202.h),
        _buildConfirmButton(),
        _buildPhoneVerificationBloc(),
      ],
    );
  }

  _buildOtpCodeTextField() {
    return CustomPinCodeFields(
      onCompleted: (submitedCode) {
        enteredOtpCode = submitedCode;
      },
    );
  }

  Widget _buildRemainingTime() {
    return CountDownTimer(
      secondsRemaining: AppConstants.timeOut,
      whenTimeExpires: () {
        Commons.showToast(message: AppStrings.timeOut);
      },
      countDownTimerStyle:
          getRegularStyle(color: ColorManager.darkGrey, fontSize: 16.sp),
    );
  }

  Widget _buildConfirmPhoneViewHeadline(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 95.w),
      child: Text(AppStrings.confirmPhoneNumber,
          style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _buildConfirmPhoneViewSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w, right: 70.w),
      child: Text(
          textAlign: TextAlign.center,
          AppStrings.confirmPhoneHint,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _buildConfirmButton() {
    return DefaultButton(
      isLoading: loading,
      text: AppStrings.confirm,
      onTap: () {
        setState(() => loading = true);
        BlocProvider.of<AuthCubit>(context).submitOTP(enteredOtpCode!);
      },
    );
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<AuthCubit, AuthResultState>(
      listener: (context, state) {
        state.whenOrNull(
          phoneAuthLoading: () {
            loading = true;
          },
          phoneOTPVerified: (credential) {
            loading = false;

            BlocProvider.of<AuthCubit>(context)
                .signInWithCredential(credential);
          },
          signInWithCredentialSuccess: (uid) {
            BlocProvider.of<AuthCubit>(context).login(uid: uid);
          },
          loginSuccess: (uid) {
            _goToHomeSuccessfully(context);
            Navigator.pushReplacementNamed(context, Routes.mainhomeviewRoute);
          },
          loginError: (networkExceptions) {
            loading = false;

            if (DioExceptionType.getErrorMessage(networkExceptions) ==
                "not_found") {
              UserNameDialog.show(
                  context: context,
                  userNameController: userNameController,
                  onRegisterTap: _onRegisterTap,
                  formKey: _formKey);
            } else {
              Commons.showToast(
                color: ColorManager.error,
                message: DioExceptionType.getErrorMessage(networkExceptions),
              );
            }
          },
          registerError: (networkExceptions) {
            loading = false;
            Commons.showToast(
                message: DioExceptionType.getErrorMessage(networkExceptions));
          },
          signInWithCredentialError: (networkExceptions) {
            loading = false;
            Commons.showToast(
                message: DioExceptionType.getErrorMessage(networkExceptions));
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
      body: _buildConfirmPhoneViewBody(context),
    );
  }

  _goToHomeSuccessfully(BuildContext context) async {
    await CacheHelper.saveData(key: 'countryCode', value: countryCode);
    Commons.showToast(
        color: ColorManager.green, message: AppStrings.loginSuccessfully);
  }

  Future<void> _onRegisterTap() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      BlocProvider.of<AuthCubit>(context).register(
          name: userNameController.text,
          uid: uid!,
          countryId: '1',
          currencyId: '1');
      await CacheHelper.saveData(key: 'countryCode', value: countryCode);
    } else {
      Commons.showToast(message: AppStrings.enterValidName);
    }
  }
}
