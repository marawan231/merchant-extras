import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  Widget _buildMainAuthLogo() {
    return Image.asset(ImageAssets.mainAuthLogo, height: 162.h, width: 137.w);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainAuthLogo();
  }
}