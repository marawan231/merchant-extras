import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';

import 'pattern_categories_item.dart';

class PatternsCategories extends StatefulWidget {
  const PatternsCategories({
    Key? key,
    required this.selectedList,
  }) : super(key: key);
  final List selectedList;

  @override
  State<PatternsCategories> createState() => _PatternsCategoriesState();
}

class _PatternsCategoriesState extends State<PatternsCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        return Wrap(
          spacing: 6.w,
          runSpacing: 20.h,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.selectedList.length, (index) {
            return PatternsCategoryItem(
              index: index,
              selectedList: widget.selectedList,
            );
          }),
        );
      },
    );
  }
}
