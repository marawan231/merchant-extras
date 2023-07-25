import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/commons.dart';
import 'package:merchant_extras/core/resources/shared_prefrences.dart';
import 'package:merchant_extras/core/resources/utils.dart';
import 'package:merchant_extras/core/web_services/network_exceptions.dart';
import 'package:merchant_extras/features/auth/data/models/auth_model.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:merchant_extras/features/profile/business_logic/cubit/profile_state.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../auth/presentation/widgets/phone_auth_textfiield.dart';
import '../widgets/personal_avatar.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool loading = false;
  late ProfileCubit profileCubit;
  final _formKey = GlobalKey<FormState>();
  User? myUser;

  @override
  initState() {
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    profileCubit.getUserInfo();
    super.initState();
  }

  Widget _buildProfileBlocBuilder() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, ProfileState state) {
        state.whenOrNull(
          getUserInfoSuccess: (user) {
            myUser = user;
            _nameController.text = user.name ?? '';
            _phoneController.text = user.phone ?? '';
            userImage = user.imageUrl ?? '';
            loading = false;
          },
          updateProfileSuccess: (model) {
            loading = false;
            profileCubit.avatarFile = null;
            Commons.showToast(
                message: AppStrings.theDataHasBeenModifiedSuccessfully,
                color: ColorManager.green);
            profileCubit.getUserInfo();
          },
          updateProfileError: (networkExceptions) {
            loading = false;
            Commons.showToast(
                message: DioExceptionType.getErrorMessage(networkExceptions));
          },
        );
      },
      builder: (context, state) {
        return _buildEditProfileViewBody();
      },
    );
  }

  _buildEditProfileViewBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              // const Warning(),
              SizedBox(height: 40.h),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [PersonalAvatar()]),
              40.widthSpace(),
              _buildNameTextField(),
              SizedBox(height: 35.h),
              PhoneAuthTextField(controller: _phoneController),
              SizedBox(height: 150.h),
              // _buildAboutMeTextfield(),
              // const Spacer(), // const MyCertificates(),
              // SizedBox(height: 32.h),
              // const PersonalVideo(),
              // SizedBox(height: 120.h),
              DefaultButton(
                  isLoading: loading,
                  text: AppStrings.agree,
                  onTap: _onPressed),
              // SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  _buildNameTextField() {
    return CustomTextField(
        controller: _nameController,
        icon: ImageAssets.user,
        title: AppStrings.name,
        hint: userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.editProfile)),
        body: _buildProfileBlocBuilder());
  }

  Future<void> editProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      myUser ??= User();
      myUser?.phone = _phoneController.text;
      myUser?.name = _nameController.text;
      myUser?.currency = '1';
      myUser?.countryId = '1';
      profileCubit.updateProfile(myUser!);
      await CacheHelper.saveData(key: 'countryCode', value: countryCode);
    }
  }

  Future<void> _onPressed() async {
    editProfile();
  }
}
