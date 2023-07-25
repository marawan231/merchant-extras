import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/constants.dart';
import 'package:merchant_extras/core/resources/shared_prefrences.dart';

import 'app/app.dart';
import 'core/resources/bloc_observer.dart';
import 'core/resources/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  token = await CacheHelper.getData(key: 'token');
  // countryCode = await CacheHelper.getData(key: 'countryCode');

  initGetIt();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(
      MyApp(),
    );
  });
}
