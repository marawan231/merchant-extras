import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.image, this.height});
  final String? image;
  final double? height;

  Widget _buildMainAuthLogo() {
    return Image.asset(
      image ?? ImageAssets.mainAuthLogo,
      height: height ?? 293.h,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainAuthLogo();
  }
}
