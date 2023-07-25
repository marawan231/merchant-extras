import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';
// import 'dart:math' as math;

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController messageController = TextEditingController();
  String enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    messageController.clear();
  }

  _buildPrefixIcon() {
    return Icon(
      Icons.camera_alt_outlined,
      color: ColorManager.darkGrey,
      size: 20.sp,
    );
  }

  _buildSuffixIcon() {
    return GestureDetector(
      onTap: () {
        _sendMessage();
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
        size: 20.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey.withOpacity(.30),
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.r), topLeft: Radius.circular(5.r))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                fillColor: ColorManager.white,
                filled: true,
                prefixIcon: _buildPrefixIcon(),
                suffixIcon: _buildSuffixIcon(),
                hintText: AppStrings.writeYourMessage,
                hintStyle: getRegularStyle(
                    color: ColorManager.grey.withOpacity(.50), fontSize: 18.sp),
              ),
              onChanged: (value) {
                setState(() {
                  enteredMessage = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
