import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/search_state.dart';
import 'pattern_categories.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_textfield.dart';
import 'arrange_categories.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  late final SearchCubit _searchCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  bool val = true;
  _buildQuantityTextField() {
    return CustomTextField(
        keyboardType: TextInputType.number,
        // validator: (p0) {
        //   if (p0!.isEmpty) {
        //     return 'من فضلك ادخل الكمية';
        //   }
        //   return null;
        // },
        onSaved: (p0) {
          _searchCubit.amount = p0!;
        },
        icon: ImageAssets.weight,
        title: AppStrings.quantity,
        suffix: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Text(
            AppStrings.kilo,
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.sp),
          ),
        ),
        hint: '1000');
  }

  _buildKiloPricePlace() {
    return Row(
      children: [
        _buildKiloPriceFromTextField(),
        SizedBox(width: 5.w),
        _buildKiloPriceToTextField(),
      ],
    );
  }

  Widget _buildKiloPriceFromTextField() {
    return Expanded(
      child: CustomTextField(
        keyboardType: TextInputType.number,

        onSaved: (p0) {
          _searchCubit.priceFrom = p0!;
        },
        // validator: (p0) {
        //   if (p0!.isEmpty) {
        //     return 'من فضلك ادخل السعر';
        //   }
        //   return null;
        // },
        icon: ImageAssets.priceTag,
        title: AppStrings.requiredKiloPrice,
        suffix: _buildSuffix(),
        hint: AppStrings.from,
      ),
    );
  }

  _buildSuffix() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(ImageAssets.dollarSign),
        SizedBox(width: 10.w),
        Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).primaryColor,
          size: 16.sp,
        ),
      ],
    );
  }

  _buildKiloPriceToTextField() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 38.h),
      child: DefaultTextField(
        keyboardType: TextInputType.number,

        onSaved: (p0) {
          _searchCubit.priceTo = p0!;
        },
        // validator: (p0) {
        //   if (p0!.isEmpty) {
        //     return 'من فضلك ادخل السعر';
        //   }
        //   return null;
        // },
        suffix: _buildSuffix(),
        hint: AppStrings.to,
      ),
    ));
  }

  // _buildSellerLocation() {
  //   return CustomTextField(
  //       icon: ImageAssets.location,
  //       title: AppStrings.shippment,
  //       suffix: Icon(
  //         Icons.arrow_back_ios_new,
  //         color: Theme.of(context).primaryColor,
  //         size: 12.sp,
  //       ),
  //       hint: AppStrings.kewit);
  // }

  _buildPatternArea() {
    return Column(
      children: [
        _buildPatternAreaTitle(),
        SizedBox(height: 14.5.h),
        _buildPatternCategories(),
      ],
    );
  }

  _buildPatternAreaTitle() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.menu,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.pattern,
          style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
        )
      ],
    );
  }

  _buildPatternCategories() {
    return PatternCategoriesFilter(
      selectedList: choicesList,
    );
  }

  _buildArrangeArea() {
    return Column(
      children: [
        _builArrangeReaTitle(),
        SizedBox(height: 14.5.h),
        _buildArrangeCategories(),
      ],
    );
  }

  _builArrangeReaTitle() {
    return Row(
      children: [
        Image.asset(
          ImageAssets.arrange,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.arrangment,
          style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
        )
      ],
    );
  }

  _buildArrangeCategories() {
    return ArrangementCategories(selectedList: arrangmentChoicesList);
  }

  // _buildApprovalSellersChecker() {
  //   return Container(
  //     width: double.infinity,
  //     height: 62.h,
  //     decoration: BoxDecoration(
  //         color: ColorManager.grey.withOpacity(.10),
  //         borderRadius: BorderRadius.all(Radius.circular(5.r))),
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 20.w, right: 20.w),
  //       child: Row(
  //         children: [
  //           Image.asset(
  //             ImageAssets.badgeCheck,
  //             width: 16.w,
  //             height: 16.h,
  //           ),
  //           SizedBox(width: 10.w),
  //           Text(
  //             AppStrings.onlyTrustedList,
  //             style:
  //                 getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
  //           ),
  //           const Spacer(),
  //           const CustomSwitch(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  _buildFilterButton() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return DefaultButton(
          isLoading: state is FilterLoading ? true : false,
          text: AppStrings.filter,
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              _searchCubit.filter();
            } else {
              Commons.showToast(message: 'من فضلك ادخل البيانات المطلوبة');
            }
          },
        );
      },
    );
  }

  _buildReassignButton() {
    return TextButton(
        onPressed: () {
          _searchCubit.resetFilter();
          // setState(() {});
          // Navigator.pop(context);
        },
        child: Text(
          AppStrings.reAssign,
          style: getRegularStyle(
              color: Theme.of(context).primaryColor, fontSize: 15.sp),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQuantityTextField(),
              SizedBox(height: 24.h),
              _buildKiloPricePlace(),
              SizedBox(height: 24.h),
              _buildPatternArea(),
              SizedBox(height: 24.h),
              _buildArrangeArea(),
              SizedBox(height: 60.h),
              _buildFilterButton(),
              // SizedBox(height: 17.h),
              _buildReassignButton(),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO refaaaaaaaaaaaaaaaaaaaaaaaactor
