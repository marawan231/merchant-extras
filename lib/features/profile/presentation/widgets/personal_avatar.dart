import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../business_logic/cubit/profile_cubit.dart';
import '../../business_logic/cubit/profile_state.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class PersonalAvatar extends StatefulWidget {
  const PersonalAvatar({super.key});

  @override
  State<PersonalAvatar> createState() => _PersonalAvatarState();
}

class _PersonalAvatarState extends State<PersonalAvatar> {
  final ImagePicker _picker = ImagePicker();
  late ProfileCubit profileCubit;

  @override
  initState() {
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    super.initState();
  }

  _buildImage(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.w,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: profileCubit.avatarFile == null
          ? CustomNetworkCachedImage(url: userImage, fit: BoxFit.fill)
          : Image.file(profileCubit.avatarFile!, fit: BoxFit.fill),
    );
  }

  _buildDarkShadow() {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: ColorManager.black.withOpacity(.50),
        shape: BoxShape.circle,
      ),
    );
  }

  _buildEditIcon() {
    return InkWell(
        onTap: getImage,
        child: Padding(
          padding: EdgeInsets.only(top: 38.h, right: 37.w),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is UpdateProfileSuccess,
            builder: (context, state) {
              return Image.asset(
                profileCubit.avatarFile == null
                    ? ImageAssets.pencil
                    : ImageAssets.close,
                width: 25.w,
                height: 25.h,
              );
            },
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(context),
        _buildDarkShadow(),
        _buildEditIcon(),
      ],
    );
  }

  Future<void> getImage() async {
    if (profileCubit.avatarFile == null) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        profileCubit.avatarFile = (File(pickedFile!.path));
      });
    } else {
      setState(() {
        profileCubit.avatarFile = null;
      });
    }
  }
}
