import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/shared_prefrences.dart';
import '../widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

//"assets/images/splash.png"
class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() {
    if (token == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.mainAuthViewRoute, (route) => false);
      //   // Navigator.pushReplacementNamed(context, Routes.mainAuthViewRoute);
      return;
    } else if (token != null) {
      refferNumber = CacheHelper.getData(key: 'refferNumber');

      Navigator.pushNamedAndRemoveUntil(
          context, Routes.mainhomeviewRoute, (route) => false);
      // Navigator.pushReplacementNamed(context, Routes.mainhomeviewRoute);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashBody(),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
