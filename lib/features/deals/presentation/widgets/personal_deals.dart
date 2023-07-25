import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';

import 'personal_buyer_deal_item.dart';

class PersonalDeals extends StatefulWidget {
  const PersonalDeals({super.key});

  @override
  State<PersonalDeals> createState() => _PersonalDealsState();
}

class _PersonalDealsState extends State<PersonalDeals> {
  late final DealsCubit _dealsCubit;
  @override
  void initState() {
    super.initState();
    _dealsCubit = BlocProvider.of<DealsCubit>(context);
  }

  Widget _buildBloc() {
    return BlocConsumer<DealsCubit, DealsState>(
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          current is GetDealsLoading ||
          current is GetDealsSuccedded ||
          current is GetDealsError ||
          current is ChangeCategorySuccedded,
      builder: (context, state) {
        return state.maybeWhen(
          getDealsSuccedded: (items) {
            return _buildDealsList();
          },
          changeCategorySuccedded: (name) {
            log(name);
            name == 'all'
                ? _dealsCubit.allDeals = _dealsCubit.dealsOfAllDealsCategory
                : {
                    _dealsCubit.allDeals = _dealsCubit.dealsOfAllDealsCategory,
                    _dealsCubit.allDeals = _dealsCubit.allDeals
                        .where((element) => element.status == name)
                        .toList()
                  };
            log('all deals length: ${_dealsCubit.allDeals.length}');
            return _buildDealsList();
          },
          orElse: () {
            return _buildDealsList();
          },
        );
      },
    );
  }

  _buildDealsList() {
    return _dealsCubit.allDeals.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: const EmptyScreen(
              message: 'لا يوجد لديك صفقات',
              image: ImageAssets.emptyBox,
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PersonalBuyerDealItem(model: _dealsCubit.allDeals[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemCount: _dealsCubit.allDeals.length);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
