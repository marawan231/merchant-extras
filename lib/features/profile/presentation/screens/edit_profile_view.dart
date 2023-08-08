import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/shared_prefrences.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../auth/data/models/auth_model.dart';
import '../../business_logic/cubit/profile_cubit.dart';
import '../../business_logic/cubit/profile_state.dart';

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
              SizedBox(height: 40.h),
              PersonalAvatar(),
              40.widthSpace(),
              _buildNameTextField(),
              SizedBox(height: 35.h),
              PhoneAuthTextField(controller: _phoneController),
              SizedBox(height: 150.h),

              // SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  _buildNameTextField() {
    return CustomTextField(
        controller: _nameController, title: AppStrings.name, hint: userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.editAccount)),
      body: _buildProfileBlocBuilder(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Future<void> editProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      myUser ??= User();
      myUser?.phone = _phoneController.text;
      myUser?.name = _nameController.text;
      myUser?.currency = '1';
      myUser?.countryId = 1;
      profileCubit.updateProfile(myUser!);
      await CacheHelper.saveData(key: 'countryCode', value: countryCode);
    }
  }

  Future<void> _onPressed() async {
    editProfile();
  }

  _buildBottomNavBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultButton(
            isLoading: loading,
            text: AppStrings.edit,
            onTap: _onPressed,
            widht: MediaQuery.of(context).size.width * 0.9),
        42.heightSpace(),
      ],
    );
  }
}
