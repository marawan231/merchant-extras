import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/error_model.dart';
import '../../../auth/data/models/auth_model.dart';

import '../../../../core/web_services/network_exceptions.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.idle() = Idle<T>;

  /// get user info
  const factory ProfileState.getUserInfoLoading() = GetUserInfoLoading<T>;

  const factory ProfileState.getUserInfoSuccess(User model) =
      GetUserInfoSuccess<T>;

  const factory ProfileState.getUserInfoError(
      DioExceptionType networkExceptions) = GetUserInfoError<T>;

  /// update profile
  const factory ProfileState.updateProfileLoading() = UpdateProfileLoading<T>;

  const factory ProfileState.updateProfileSuccess(ErrorModel model) =
      UpdateProfileSuccess<T>;

  const factory ProfileState.updateProfileError(
      DioExceptionType networkExceptions) = UpdateProfileError<T>;
}
