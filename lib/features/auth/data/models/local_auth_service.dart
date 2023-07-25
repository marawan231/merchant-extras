import 'dart:developer';

import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthinticate() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthinticate()) return false;

      return await _auth.authenticate(
        localizedReason: 'Use Face ID to authenticate',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true),
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
        ],
      );
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
