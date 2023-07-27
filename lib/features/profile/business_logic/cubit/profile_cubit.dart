import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/shared_prefrences.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../auth/data/models/auth_model.dart';

import '../../data/repository/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(const ProfileState.idle());

  final ProfileRepository profileRepository;
  User? user;
  File? avatarFile;

  void getUserInfo() async {
    emit(const ProfileState.getUserInfoLoading());

    countryCode = await CacheHelper.getData(key: 'countryCode');
    var result = await profileRepository.getUserInfo();
    result.when(
      success: (User model) {
        user = model;
        userName = model.name ?? 'اسم المستخدم';
        emit(ProfileState.getUserInfoSuccess(model));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(ProfileState.getUserInfoError(networkExceptions));
      },
    );
  }

  void updateProfile(User user) async {
    emit(const ProfileState.updateProfileLoading());

    var result = await profileRepository.updateProfile(user, avatarFile);
    result.when(
      success: (model) {
        emit(ProfileState.updateProfileSuccess(model));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(ProfileState.updateProfileError(networkExceptions));
      },
    );
  }
}
