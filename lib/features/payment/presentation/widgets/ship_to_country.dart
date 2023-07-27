import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class ShipToCountry extends StatefulWidget {
  const ShipToCountry({super.key});

  @override
  State<ShipToCountry> createState() => _ShipToCountryState();
}

class _ShipToCountryState extends State<ShipToCountry> {
  void chooseCountry(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.r),
                ),
              ),
              title: const Center(child: Text(AppStrings.chooseCountry)),
              content: SizedBox(
                width: 300.w,
                height: 300.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: ColorManager.grey,
                    );
                  },
                  itemCount: BlocProvider.of<GlobalCubit>(context)
                      .allCountriesCurrencies!
                      .length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        BlocProvider.of<GlobalCubit>(context)
                            .allCountriesCurrencies![index]
                            .name!,
                        style: getBoldStyle(
                            fontSize: 18.sp, color: ColorManager.primary),
                      ),
                      onTap: () {
                        BlocProvider.of<GlobalCubit>(context).chooseCountry =
                            BlocProvider.of<GlobalCubit>(context)
                                .allCountriesCurrencies![index]
                                .name;

                        BlocProvider.of<GlobalCubit>(context).choosenCountryId =
                            BlocProvider.of<GlobalCubit>(context)
                                .allCountriesCurrencies![index]
                                .id
                                .toString();
                        log('choosenCountryId: ${BlocProvider.of<GlobalCubit>(context).choosenCountryId}');

                        setState(() {});
                        Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        readOnly: true,
        onTap: () {
          chooseCountry(context);
        },
        onSaved: (p0) {},
        icon: ImageAssets.location,
        iconHeight: 16.sp,
        iconWidth: 16.sp,
        title: AppStrings.shipTo,
        suffix: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16.sp,
          color: ColorManager.primary,
        ),
        hint: BlocProvider.of<GlobalCubit>(context).chooseCountry ??
            AppStrings.chooseCountry);
  }
}
