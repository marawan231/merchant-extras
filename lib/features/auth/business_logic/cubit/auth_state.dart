import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/auth_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthResultState<T> with _$AuthResultState<T> {
  const factory AuthResultState.idle() = Idle<T>;

  const factory AuthResultState.loginLoading() = LoginLoading<T>;

  const factory AuthResultState.loginSuccess(T uid) = LoginSuccess<T>;

  const factory AuthResultState.loginError(DioExceptionType networkExceptions) =
      LoginError<T>;

  // const factory AuthResultState.firebaseLoginSuccess(String data) =
  //     FirebaseLoginSuccess<T>;

  const factory AuthResultState.registerLoading() = RegisterLoading<T>;

  const factory AuthResultState.registerSuccess(AuthModel userData) =
      RegisterSuccess<T>;

  const factory AuthResultState.registerError(
      DioExceptionType networkExceptions) = RegisterError<T>;

  const factory AuthResultState.firebaseGoogleLoginSuccess(String data) =
      FirebaseGoogleLoginSuccess<T>;

  const factory AuthResultState.firebaseGoogleLoginLoading() =
      FirebaseGoogleLoginLoading<T>;

  const factory AuthResultState.firebaseGoogleLoginError(
      DioExceptionType networkExceptions) = FirebaseGoogleLoginError<T>;

  const factory AuthResultState.phoneAuthLoading() = PhoneAuthLoading<T>;

  const factory AuthResultState.phoneAuthErrorOccurred(String errorMsg) =
      PhoneAuthErrorOccurred<T>;

  const factory AuthResultState.phoneNumberSubmited() = PhoneNumberSubmited<T>;

  const factory AuthResultState.phoneOTPVerified(
      PhoneAuthCredential credential) = PhoneOTPVerified<T>;

  const factory AuthResultState.signInWithCredentialSuccess(
      {required String uid}) = SignInWithCredentialSuccess<T>;

  const factory AuthResultState.signInWithCredentialError(
      DioExceptionType networkExceptions) = SignInWithCredentialError<T>;

  //facIdAuth
  const factory AuthResultState.facIdAuthLoading() = FacIdAuthLoading<T>;

  const factory AuthResultState.facIdAuthSuccess({required String uid}) =
      FacIdAuthSuccess<T>;

  const factory AuthResultState.facIdAuthError(
      DioExceptionType networkExceptions) = FacIdAuthError<T>;

  const factory AuthResultState.firebaseAnonymousLoginSuccess(String data) =
      FirebaseAnonymousLoginSuccess<T>;
  const factory AuthResultState.firebaseAnonymousLoginLoading() =
      FirebaseAnonymousLoginLoading<T>;
  const factory AuthResultState.firebaseAnonymousLoginError(
      DioExceptionType networkExceptions) = FirebaseAnonymousLoginError<T>;
}
/*


 */
