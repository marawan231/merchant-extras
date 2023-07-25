import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/messages_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/chats.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});
  _buildChatViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: ListView(
        children: [
          _buildTitle(context),
          SizedBox(height: 20.h),
          const Chats(),
        ],
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Text(
      AppStrings.chats,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: ColorManager.darkGrey,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.orangeFlibine),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            BlocProvider.of<MessagesCubit>(context).backTo(2);
          },
        ),
      ),
      body: _buildChatViewBody(context),
    );
  }
}
