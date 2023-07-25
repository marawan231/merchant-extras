import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';
import '../../business_logic/cubit/messages_cubit.dart';
import '../../business_logic/cubit/messages_state.dart';
import 'messages_category_item.dart';

class MessagesCategories extends StatefulWidget {
  const MessagesCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<MessagesCategories> createState() => _MessagesCategoriesState();
}

class _MessagesCategoriesState extends State<MessagesCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MessagesCategoryItem(
                    index: index, title: messagesCategories[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 5.w);
              },
              itemCount: messagesCategories.length),
        );
      },
    );
  }
}

