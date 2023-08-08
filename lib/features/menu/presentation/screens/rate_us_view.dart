import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/route_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../business_logic/cubit/menu_cubit.dart';
import '../../business_logic/cubit/menu_state.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';
import '../widgets/rate_item.dart';

class RateUsView extends StatefulWidget {
  const RateUsView({super.key, this.isDealRate = false, required this.dealId});

  final bool? isDealRate;
  final String? dealId;

  @override
  State<RateUsView> createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  final TextEditingController _commentController = TextEditingController();

  //create form key
  final _formKey = GlobalKey<FormState>();

  _buildRateUsViewBody() {
    return ListView(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 30.h),
      children: [
        _buildRatingList(),
        SizedBox(height: 27.h),
        _buildNotesTextField(),
        SizedBox(height: 100.h),
        _buildButton(),
      ],
    );
  }

  _buildNotesTextField() {
    return Form(
      key: _formKey,
      child: CustomTextField(
        controller: _commentController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'من فضلك ادخل ملاحظاتك';
          }
          return null;
        },
        contentPadding: EdgeInsets.only(
          top: 79.h,
          right: 20.w,
        ),
        title: AppStrings.notes,
        suffix: const Text(''),
        hint: AppStrings.typeYourNotes,
      ),
    );
  }

  _buildRatingList() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RateItem(
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: 4);
  }

  _buildButton() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          rateSuccedded: () {
            Commons.showToast(
                message: 'شكرا لتقييمك لنا', color: ColorManager.green);
            Navigator.pop(context);
          },
          rateUsSuccedded: () {
            Navigator.pushNamed(context, Routes.messageViewRoute, arguments: {
              'image': ImageAssets.onlineReviewCuate,
              'title': AppStrings.thanksForYourReview,
              'description': AppStrings.yourRateIsVeryImportantToUs,
            });
          },
          rateError: (message) {
            Commons.showToast(
                message: DioExceptionType.getErrorMessage(message));
          },
        );
      },
      builder: (context, state) {
        return DefaultButton(
          isLoading: state is RateLoading ? true : false,
          text: AppStrings.send,
          onTap: () {
            // _formKey.currentState!.validate();
            if (_formKey.currentState!.validate()) {
              if (widget.isDealRate!) {
                BlocProvider.of<MenuCubit>(context).rateDeal(
                  dealId: widget.dealId ?? '0',
                  comment: _commentController.text,
                );
              } else {
                BlocProvider.of<MenuCubit>(context).rateUs(
                  comment: _commentController.text,
                );
              }
            } else {
              Commons.showToast(message: 'من فضلك ادخل ملاحظاتك');
            }
            // log('asda');
            // BlocProvider.of<MenuCubit>(context).rateDeal(
            //   dealId: '0',
            //   comment: '',
            // );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.isDealRate! ? AppStrings.theRate : AppStrings.rateUs)),
      body: _buildRateUsViewBody(),
    );
  }
}
