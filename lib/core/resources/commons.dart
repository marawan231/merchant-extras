import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'strings_manager.dart';
import 'color_manager.dart';

import '../widgets/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/confirmation_dialog.dart';
import 'font_manager.dart';

class Commons {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const LoadingIndicator(),
                    SizedBox(height: 16.h),
                    const Text(
                      AppStrings.waitPlease,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(
                message,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: FontConstants.defaultFontFamily),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.defaultFontFamily,
                          fontSize: 14)),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('ok'),
                ),
              ],
            ));
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? ColorManager.error,
    );
  }

  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            ConfirmationDialog(alertMsg: 'alert', onTapConfirm: () {}));
  }

  static Future<void> openUrl(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static dynamic decodeJson(Response<dynamic> response) {
    var responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              message,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: FontConstants.defaultFontFamily),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstants.defaultFontFamily,
                        fontSize: 14)),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('ok'),
              ),
            ],
          ));
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.primary,
    elevation: 0,
    content: const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
