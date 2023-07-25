import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/route_manager.dart';
import 'package:merchant_extras/features/search/business_logic/cubit/search_cubit.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/main_search_view_item.dart';

class PickDealTypeToSearchInView extends StatefulWidget {
  const PickDealTypeToSearchInView({super.key});

  @override
  State<PickDealTypeToSearchInView> createState() =>
      _PickDealTypeToSearchInViewState();
}

class _PickDealTypeToSearchInViewState
    extends State<PickDealTypeToSearchInView> {
  _buildMainSearchViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(),
          SizedBox(height: 32.h),
          _buildSubHeadline(context),
          SizedBox(height: 30.h),
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

  _buildSearchChoicesList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MainSearchViewItem(
            leading: mainSearchList[index].iconData,
            title: mainSearchList[index].title,
            index: index,
            onTap: () {
              setState(() {
                maiSearchListDefaultIndex = index;
              });
            },
            onArrowTap: () {
              BlocProvider.of<SearchCubit>(context).title =
                  mainSearchList[index].title;
              BlocProvider.of<SearchCubit>(context).geography =
                  index == 0 ? "international" : "locale";
              // BlocProvider.of<SearchCubit>(context)
              //     .showPickedSearchTypeView(index)
              // ;
              Navigator.of(context).pushNamed(Routes.worldSearchViewRoute);
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 14.h);
        },
        itemCount: mainSearchList.length);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainSearchViewBody(context);
  }
}
