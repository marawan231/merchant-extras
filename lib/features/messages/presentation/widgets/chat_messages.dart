import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key}) : super(key: key);



  _buildStream(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(
              bottom: 50.h,
              right: 20.w,
              left: 20.w,
            ),
            // reverse: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
            reverse: true,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return MessageBubble(
                index: index,
                message: "null",
                date: '1/2',
                isMe: index == 1 ? true : false,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStream(context);
  }
}

/* 

 */
