import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'chats_item.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ChatsItem(
            leading: ImageAssets.avatar,
            title: AppStrings.chatUserName,
            index: index,
            onTap: () => Navigator.pushNamed(context, Routes.chatViewRoute),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: 10);
  }
}
