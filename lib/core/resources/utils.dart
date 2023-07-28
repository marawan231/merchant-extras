import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'strings_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../widgets/custom_network_image.dart';
import 'constants.dart';
import 'route_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// final LocalAuthentication localAuthentication = LocalAuthentication();

// Future<bool> isDeviceSupportBiometric() async {
//   bool isBiometricSupported = await localAuthentication.isDeviceSupported();
//   return isBiometricSupported;
// }

// Future<List<BiometricType>> getAvailableBiometrics() async {
//   return await localAuthentication.getAvailableBiometrics();
// }
String convertDateFormat(String iso8601Date) {
  DateTime dateTime = DateTime.parse(iso8601Date);

  String dateString = DateFormat('yyyy-MM-dd').format(dateTime);
  // defaultLang == 'ar'
  //     ? dateString = DateFormat('dd-MM-yyyy').format(dateTime)
  //     : dateString = DateFormat('yyyy-MM-dd').format(dateTime);

  // calender = CacheHelper.getData(key: 'calender');
  // if (calender == 'hijri') {
  //   HijriCalendar hijriCalendar = HijriCalendar.fromDate(dateTime);
  //   return hijriCalendar.toString();
  // } else {
  return dateString;
}

String getCountryFlag() {
  String countryCode = 'sa';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}

defaultAppBar(BuildContext context) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: false,
    title: buildMainSearchViewAppBarTitle(context),
    actions: buildMainSearchViewAppBarActions(context),
  );
}

buildMainSearchViewAppBarTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: Text(
      viewsTitles[screenIndex],
      style: Theme.of(context).textTheme.headlineLarge,
    ),
  );
}

buildMainSearchViewAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, Routes.notificationViewRoute);
          },
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CustomNetworkCachedImage(
                url: userImage,
                height: 40.w,
                width: 40.w,
                fit: BoxFit.cover,
              ))),
    )
  ];
}

getTitle(String status) {
  switch (status) {
    case 'all':
      return AppStrings.all;
    case 'active':
      return AppStrings.shipMaking;
    case 'processing':
      return AppStrings.transaferProgressing;
    case 'out_for_delivery':
      return AppStrings.onWay;
    case 'complete':
      return AppStrings.completed;
    case 'closed':
      return AppStrings.closed;

    default:
      '';
  }
}

bool validateAndSave(final GlobalKey<FormState> formKey) {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}

buildEmptyDeals() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 170.h,
        width: 190.w,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

void getRoute(int index, BuildContext context) {
  if (index == 0) {
    Navigator.of(context).pushNamed(Routes.phoneAuthViewRoute);
  } else if (index == 1) {
    Navigator.of(context).pushNamed(Routes.faceAuthViewRoute);
  } else if (index == 2) {
    BlocProvider.of<AuthCubit>(context).signInWithGoogle(context);
  }
}

extension MySizedBox on int {
  Widget heightSpace() {
    return SizedBox(height: toDouble().h);
  }

  Widget widthSpace() {
    return SizedBox(width: toDouble().w);
  }
}
