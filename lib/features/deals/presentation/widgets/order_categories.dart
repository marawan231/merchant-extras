import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';
import 'order_item.dart';

class OrderCategories extends StatefulWidget {
  const OrderCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCategories> createState() => _OrderCategoriesState();
}

class _OrderCategoriesState extends State<OrderCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: List.generate(
              // growable: false,

              orderCategories.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: OrderItem(
                    index: index,
                    selectedList: orderCategories,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
