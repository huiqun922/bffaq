import 'package:flutter/material.dart';

import 'global.dart';

class TextUtils{

  static TextStyle? regularDartText({double fontSize = 14,Color textColor = textDarkColor}){
    return TextStyle(color:textColor,fontSize: fontSize,fontWeight: FontWeight.w400);
  }
  static TextStyle? regularGrayText({double fontSize = 14,Color textColor = textGrayColor}){
    return TextStyle(color:textColor,fontSize: fontSize,fontWeight: FontWeight.w400);
  }

  static TextStyle? mediumDartText({double fontSize = 24,Color textColor = textDarkColor}){
    return TextStyle(color:textColor,fontSize: fontSize,fontWeight: FontWeight.w500);
  }

  static TextStyle? mediumGrayText({double fontSize = 24,Color textColor = textGrayColor}){
    return TextStyle(color:textColor,fontSize: fontSize,fontWeight: FontWeight.w500);
  }

  static String hexString(List<int> data){
    String hex = "";
    for (var element in data) {
      String hexChar = element.toRadixString(16);
      hexChar = hexChar.length==1?"0$hexChar":hexChar;
      hex+=hexChar.toUpperCase();
    }
    return hex;
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

}