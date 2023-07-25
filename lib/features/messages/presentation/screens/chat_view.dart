import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/chat_warning.dart';
import '../widgets/change_currency_message.dart';

import '../widgets/chat_messages.dart';
import '../widgets/new_message.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Icon(
              Icons.settings,
            ),
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              ImageAssets.userImage,
              width: 27.w,
              height: 27.h,
            ),
            SizedBox(width: 10.w),
            const Text(AppStrings.chatUserName),
          ],
        ),
      ),
      body: Column(
        children: [
          // Expanded(),
          SizedBox(height: 30.h),

          const ChatWarning(),
          SizedBox(height: 62.h),
          const ChangeCurrencyMessage(),
          SizedBox(height: 62.h),

          const Expanded(
            child: ChatMessages(),
          ),
          const NewMessage(),
        ],
      ),
    );
  }
}
