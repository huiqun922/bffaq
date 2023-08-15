import 'package:flutter/material.dart';
import 'package:bfweb/utils/global.dart';

enum BtnType{
  dart, //黑底白字
  light, //白底黑字
  alarm //红底白字
}

class UIFactory{

  static Widget textButton(final String title,
      final VoidCallback? onPressed,{
      final double? width,
      final BtnType type = BtnType.dart,
      final EdgeInsetsGeometry? padding,
      final EdgeInsetsGeometry? margin,
      }){
    return Container(
          height: 44.0,
          width: width,
          margin: margin??EdgeInsets.zero,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          padding: padding,
          decoration: BoxDecoration(
            color: type==BtnType.alarm?bgAlarmColor:(type==BtnType.dart?bgDarkColor:Colors.white),
            border: Border.all(
              color: const Color(0xFFD6D6D6),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(42.5),
            boxShadow: const [
               BoxShadow(
                color: Color(0x7FE0E1E3),
                offset: Offset(3, 5),
                blurRadius:6,
              )
            ]
          ),
          child: TextButton(onPressed: onPressed,
            style: ButtonStyle(
                padding:  MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                // overlayColor: type==BtnType.dart?MaterialStateProperty.all<Color>(const Color(0xff666666)):
                // MaterialStateProperty.all<Color>(const Color(0xffF6F6F6))

            ),
            child: Container(
                alignment: Alignment.center,
                child:Text(title,
                  style:TextStyle(fontSize: 15,
                      color: type==BtnType.dart||type==BtnType.alarm?Colors.white:textGrayColor),)),
          )
    );
  }
}