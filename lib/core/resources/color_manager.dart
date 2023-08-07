import 'package:flutter/material.dart';

import 'constants.dart';

class ColorManager {
  static Color seconadary = const Color(0xff016064);
  static Color primary =
      switchToBuyerVersion! ? const Color(0xff009688) : const Color(0xff016064);
  static Color lightPrimary = const Color(0xffF2FEFD);

  //7F090B
  static Color orange = const Color(0xffFF0000);
  static Color boldGrey = const Color(0xff646464);
  static Color lightGrey3 = const Color(0xffe4e4e4);
  static Color lightGrey2 = const Color(0xff9A9A9A);
  static Color lightWhite = const Color(0xFFF7F7F7);
  static Color backGrey = const Color(0xffF9F9F9);
  static Color darkGrey = const Color(0xff858585);
  static Color grey = const Color(0xffB1B1B1);
  static Color black = const Color(0xff000000);
  static Color transparent = Colors.transparent;
  static Color white = const Color(0xffFFFFFF);
  static Color amber = const Color(0xffFFDF00);
  static Color green = const Color(0xff08D100);
  static Color gold = const Color(0xffAF7900);
  static Color active = const Color(0xff147F00);
  static Color dividerColor = const Color(0xffDCDCDC);

  static Color darkPrimary = const Color(0xff3799C9);
  static Color defaultBackground = const Color(0xffF0F7FA);

  static Color lightGrey = const Color(0xff5B5A5A);
  static Color background = const Color(0xff949494);

  static Color lightBlack = const Color(0xffF3F3F3);
  static Color transparentRed = const Color(0xffFF0000).withOpacity(.08);
  static Color red = const Color(0xffFf0000);

  static Color dividerColorLight = const Color(0xffD9D9D9);
  static Color borderInInputTextFiefld = const Color(0xffEEEEEE);
  static Color unSelectedStar = const Color(0xffDFDFDF);

  // new colors
  static Color cfGrey = const Color(0xffCFCFCB);
  static Color cfGrey2 = const Color(0xffF7F7F7).withOpacity(.2);
  static Color seventyGrey = const Color(0xff707070);
  static Color error = const Color(0xffe61f34);
  static Color darkSeconadry = const Color(0xffB1B1B1);
  static const Color textDarkColor = Color(0xff858585);
}
