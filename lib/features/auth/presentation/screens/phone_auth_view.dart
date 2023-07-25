import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 30.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            const AuthLogo(),
            SizedBox(height: 42.h),
            _buildPhoneAuthTitle(context),
            SizedBox(height: 12.h),
            _buildPhoneAuthSubTitle(context),
            SizedBox(height: 42.h),
            _buildPhoneTextField(),
            SizedBox(height: 138.h),
            _buildBottomButton(context),
            SizedBox(height: 13.h),
            const Center(child: TermsAndConditions()),
            _buildPhoneNumberSubmitedBloc(),
          ],
        ),
      ),
    );
  }

  _buildPhoneTextField() {
    return PhoneAuthTextField(controller: _phoneController);
  }

  _buildPhoneAuthTitle(BuildContext context) {
    return Center(
      child: Text(AppStrings.authWithPhone,
          style: Theme.of(context).textTheme.titleMedium),
    );
  }

  _buildPhoneAuthSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w),
      child: Text(
          textAlign: TextAlign.center,
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
