import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';
import 'add_deal_category_item.dart';


class AddDealCategories extends StatefulWidget {
  const AddDealCategories({
    Key? key,
    required this.selectedList,
  }) : super(key: key);
  final List selectedList;

  @override
  State<AddDealCategories> createState() => _AddDealCategoriesState();
}

class _AddDealCategoriesState extends State<AddDealCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.selectedList.length, (index) {
              return AddDealCategoryItem(
                index: index,
                selectedList: widget.selectedList,
              );
            }),
          ),
        );
      },
    );
  }
}
