// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:merchant_extras/core/resources/shared_prefrences.dart';
import 'package:merchant_extras/features/auth/data/models/local_auth_service.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/auth_model.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthResultState<dynamic>> {
  AuthCubit(this.authRepoistry) : super(const Idle());
  final _auth = FirebaseAuth.instance;
  final AuthRepoistry authRepoistry;

  String verificationId = '';

  void facIdAuth() async {
    emit(const AuthResultState.facIdAuthLoading());
    var result = await LocalAuth.authenticate();
    if (result == true) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      // log('Running on ${iosInfo.identifierForVendor}'); // e.g. "iPod7,1"
      if (Platform.isAndroid) {
        log('adasdsad android');
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        log('Running on ${androidInfo.id}'); //
        uid = androidInfo.id;
      } else if (Platform.isIOS) {
        log('adasdsad ios');
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        uid = iosInfo.identifierForVendor;
      } else {
        log('adasdsad else');
      }
      log('Running on $uid');
      emit(AuthResultState.facIdAuthSuccess(uid: uid!));
    } else {
      emit(AuthResultState.facIdAuthError(
          DioExceptionType.getDioException('error')));
    }
    // result.when(
    //   success: (String uid) {
    //     emit(AuthResultState.facIdAuthSuccess(uid: uid));
    //   },
    //   failure: (DioExceptionType networkExceptions) {
    //     emit(AuthResultState.facIdAuthError(networkExceptions));
    //   },
    // );
  }
  void signInAnonymously() async {
    emit(const AuthResultState.firebaseAnonymousLoginLoading());

    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final UserCredential result = await auth.signInAnonymously();
      final user = result.user;
      uid = user!.uid;
      isAnonymous = true;
      CacheHelper.saveData(key: 'isAnonymous', value: true);
      emit(AuthResultState.firebaseAnonymousLoginSuccess(user.uid));
    } catch (e) {
      emit(AuthResultState.firebaseAnonymousLoginError(
          DioExceptionType.getDioException(e)));
    }
  }
  void login({
    required String uid,
  }) async {
    emit(const AuthResultState.loginLoading());
    var result = await authRepoistry.login(uid);
    result.when(
      success: (AuthModel userData) async {
        token = userData.token!;
        userName = userData.user!.name!;
        refferNumber = userData.user!.referrerCode!;
        await CacheHelper.saveData(key: 'token', value: token);
        await CacheHelper.saveData(key: 'refferNumber', value: refferNumber);

        // userPhone = userData.user!.phone!;
        emit(AuthResultState.loginSuccess(userData));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(AuthResultState.loginError(networkExceptions));
      },
    );
  }

  void register({
    required String uid,
    required String name,
    required String countryId,
    required String currencyId,
    String? email = '',
    String? phone = '',
    String? imageUrl = '',
    String? referrerKey = '',
  }) async {
    emit(const AuthResultState.registerLoading());
    var result = await authRepoistry.registerNewUser(
        uid, name, countryId, currencyId, email, phone, imageUrl, referrerKey);
    result.when(
      success: (AuthModel userData) async {
        token = userData.token!;
        userName = userData.user!.name!;
        refferNumber = userData.user!.referrerCode!;
        await CacheHelper.saveData(key: 'token', value: uid);
        await CacheHelper.saveData(key: 'refferNumber', value: refferNumber);

        // userPhone = userData.user!.phone!;
        // userImage = userData.user!.imageUrl!;
        emit(AuthResultState.registerSuccess(userData));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(AuthResultState.registerError(networkExceptions));
      },
    );
  }

  signInWithGoogle(BuildContext context) async {
    emit(const AuthResultState.firebaseGoogleLoginLoading());
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();
      userName = googleUser!.displayName!;
      userEmail = googleUser.email;
      emit(AuthResultState.firebaseGoogleLoginSuccess(googleUser.id));
      print('gooooooogle ${googleUser.displayName!}');
      userImage = googleUser.photoUrl!;
    } catch (e) {
      log('error in google sign in ${e.toString()}', name: 'google sign in');
      emit(AuthResultState.firebaseGoogleLoginError(
          DioExceptionType.getDioException(e)));
    }
  }

  Future<void> submitPhoneNumber(
      {required String phoneCode, required String phoneNumber}) async {
    emit(const AuthResultState.phoneAuthLoading());
    await _auth.verifyPhoneNumber(
      phoneNumber: '$phoneCode$phoneNumber',
      timeout: const Duration(seconds: AppConstants.timeOut),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signInWithPhoneNumber(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(AuthResultState.phoneAuthErrorOccurred(error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;

    emit(const AuthResultState.phoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signInWithPhoneNumber(credential);
  }

  Future<void> signInWithPhoneNumber(PhoneAuthCredential credential) async {
    try {
      emit(AuthResultState.phoneOTPVerified(credential));
    } catch (error) {
      emit(AuthResultState.phoneAuthErrorOccurred(error.toString()));
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await _auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: credential.verificationId!,
              smsCode: credential.smsCode!))
          .then((value) async {
        uid = _auth.currentUser!.uid;

        emit(AuthResultState.signInWithCredentialSuccess(
            uid: _auth.currentUser!.uid));
      });
    } catch (error) {
      emit(AuthResultState.signInWithCredentialError(
          DioExceptionType.getDioException(error)));
    }
  }
}
