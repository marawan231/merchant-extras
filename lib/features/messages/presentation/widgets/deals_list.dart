import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/messages_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'deals_item.dart';


class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DealsItem(
              onTap: () {
                BlocProvider.of<MessagesCubit>(context).goToChatsView();
              },
              leading: ImageAssets.orange,
              title: AppStrings.orangeFlibine,
              index: index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: 10);
  }
}
