import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/pick_deal_type_item.dart';

class PickDealTypeInMyDealsView extends StatefulWidget {
  const PickDealTypeInMyDealsView({super.key});

  @override
  State<PickDealTypeInMyDealsView> createState() =>
      _PickDealTypeInMyDealsViewState();
}

class _PickDealTypeInMyDealsViewState extends State<PickDealTypeInMyDealsView> {
  _buildMainSearchViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),
      child: Column(
        children: [
          _buildLogo(),
          SizedBox(height: 27.h),
          _buildSubHeadline(context),
          SizedBox(height: 42.h),
          _buildSearchChoicesList(),
        ],
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.mainSearchLogo,
      width: 160.w,
      height: 150.h,
    );
  }

  _buildSubHeadline(BuildContext context) {
    return Text(
      AppStrings.chooseDeals,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  //refactor this to cubit

  _buildSearchChoicesList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PickDealTypeItem(
            leading: mainSearchList[index].iconData,
            title: mainSearchList[index].title,
            index: index,
            onTap: () {
              setState(() {
                maiSearchListDefaultIndex = index;
              });
            },
            onArrowTap: () {
              BlocProvider.of<GlobalCubit>(context)
                  .changeSelectedIndex(index == 0 ? 10 : 11);
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: mainSearchList.length);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainSearchViewBody(context);
  }
}
