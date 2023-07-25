import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/route_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/search_state.dart';
import 'pattern_category_item.dart';

class PatternCategoriesFilter extends StatefulWidget {
  const PatternCategoriesFilter({
    Key? key,
    required this.selectedList,
  }) : super(key: key);
  final List selectedList;

  @override
  State<PatternCategoriesFilter> createState() => _PatternCategoriesFilterState();
}

class _PatternCategoriesFilterState extends State<PatternCategoriesFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RouteGenerator.searchCubit,
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.selectedList.length, (index) {
                return PatternInFilterCategoryItem(
                  index: index,
                  selectedList: widget.selectedList,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
