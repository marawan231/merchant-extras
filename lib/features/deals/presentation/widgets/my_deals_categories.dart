import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';
import 'my_deals_category_item.dart';

class MyDealsCategories extends StatefulWidget {
  const MyDealsCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDealsCategories> createState() => _MyDealsCategoriesState();
}

class _MyDealsCategoriesState extends State<MyDealsCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MyDealsCategoryItem(
                  index: index,
                  // selectedList: myDealsCategories,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.w);
              },
              itemCount: myDealsCategories.length),
        );
      },
    );
  }
}
