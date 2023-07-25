import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/route_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../business_logic/cubit/search_state.dart';
import 'arrange_category_item.dart';

class ArrangementCategories extends StatefulWidget {
  const ArrangementCategories({
    Key? key,
    required this.selectedList,
  }) : super(key: key);
  final List selectedList;

  @override
  State<ArrangementCategories> createState() => _ArrangementCategoriesState();
}

class _ArrangementCategoriesState extends State<ArrangementCategories> {
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
                return ArrangeCategoryItem(
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
