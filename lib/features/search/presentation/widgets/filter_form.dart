import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/features/search/presentation/widgets/price_slider.dart';
import '../../../../core/resources/commons.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/search_state.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
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
        onSaved: (p0) {
          _searchCubit.amount = p0!;
        },
        // icon: ImageAssets.weight,
        title: AppStrings.quantity.replaceAll(':', ''),
        suffix: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Text(
            AppStrings.piece,
            style: getBoldStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.sp),
          ),
        ),
        hint: 'ادخل الكمية المطلوبة');
  }

  _buildArrangeArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _builArrangeReaTitle(),
        SizedBox(height: 14.5.h),
        _buildArrangeCategories(),
      ],
    );
  }

  _builArrangeReaTitle() {
    return Text(
      AppStrings.arrangment.replaceAll(':', ''),
      style: getBoldStyle(color: ColorManager.black, fontSize: 17.sp),
    );
  }

  _buildArrangeCategories() {
    return ArrangementCategories(selectedList: arrangmentChoicesList);
  }

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

  // _buildPriceRange() {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PriceSlider(),
            44.verticalSpace,
            _buildQuantityTextField(),
            44.verticalSpace,
            _buildArrangeArea(),
            100.verticalSpace,
            _buildFilterButton(),
            // _buildReassignButton(),
          ],
        ),
      ),
    );
  }
}
