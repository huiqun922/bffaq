import 'dart:core';

import 'package:bfweb/utils/size_fit.dart';
import 'package:bfweb/utils/ui/text_field.dart';
import 'package:bfweb/utils/ui/ui_factory.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'ui/card.dart';
import '';

class AlertUtils{
  static Future<dynamic> show(BuildContext context,String title,String? message,{
    String? left,
    String? right,
    VoidCallback? leftAction,
    VoidCallback? rightAction,
  })async {
   return await showDialog(context: context, builder: (BuildContext ctx) {
      return CustomDialog(title: title,
        message: message,
        left: left,
        leftAction: leftAction,
        right:right,
        rightAction: rightAction,);
    },barrierDismissible: false);
  }
  static Future<dynamic> showTips(BuildContext context,String title,String? message,{
    String? tips,
    VoidCallback? tipsAction,
  })async {
    return await showDialog(context: context, builder: (BuildContext ctx) {
      return CustomDialog(title: title,
        message: message,
        right:tips,
        rightAction: tipsAction,
        type: AlertType.tips);
    },barrierDismissible: false);
  }

  static void prompt(BuildContext context,String title,String value,{
    String? hintText,
    String? left,
    String? right,
    VoidCallback? leftAction,
    VoidCallback? rightAction,
    ValueChanged<String>? valueChanged,

  }) {
    showDialog(context: context, builder: (BuildContext ctx) {
      return CustomDialog(title: title,
        left: left,
        leftAction: leftAction,
        right:right,
        rightAction: rightAction,
        value:value,
        valueChanged: valueChanged,
        type: AlertType.prompt,
      );
    },barrierDismissible: false);
  }
}

enum AlertType{
  normal, //两个按钮
  tips, //一个按钮
  prompt //两个按钮带输入框
}

class CustomDialog extends Dialog{

  AlertType type;
  String? title;
  String? message;
  String? left;
  String? right;
  VoidCallback? leftAction;
  VoidCallback? rightAction;

  String? value;
  String? hintText;
  ValueChanged<String>? valueChanged;

  CustomDialog({super.key,
    this.title,
    this.message,
    this.left,
    this.leftAction,
    this.right,
    this.rightAction,
    this.type = AlertType.normal,
    this.value,
    this.hintText,
    this.valueChanged
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: const Alignment(0,-0.3),
      child: alert(context),
    );
  }

  Widget alert(BuildContext context) {
    switch(type){
      case AlertType.prompt:
        return alertPrompt(context);
      case AlertType.tips:
        return alertTips(context);
      default:
        return alertNormal(context);
    }
  }
  Widget alertNormal(BuildContext context) {
    return CardView(
      padding: EdgeInsets.symmetric(horizontal: 16.scale, vertical: 24.scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title??"",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                color: textDarkColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.scale),
          Text(
            message??"",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: textGrayColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 36.scale),
          Row(
            children: [
              UIFactory.textButton(
                  left ?? "YES",
                      () {
                    Navigator.pop(context, 0);
                    if (leftAction != null) {
                      leftAction!();
                    }
                  },
                  width: 150.scale,
                  type: BtnType.light),
              SizedBox(width: 16.scale),
              UIFactory.textButton(
                  right ?? "NO",
                      () {
                    Navigator.pop(context,1);
                    if (rightAction != null) {
                      rightAction!();
                    }
                  },
                  width: 150.scale,
                  type: BtnType.dart),
            ],
          )
        ],
      ),
    );
  }

  Widget alertTips(BuildContext context) {
    return CardView(
      padding: EdgeInsets.symmetric(horizontal: 16.scale, vertical: 24.scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title??"",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                color: textDarkColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.scale),
          Text(
            message??"",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: textGrayColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 36.scale),
          UIFactory.textButton(
              right ?? "OK",
                  () {
                Navigator.pop(context,1);
                if (rightAction != null) {
                  rightAction!();
                }
              },
              width: 150.scale,
              type: BtnType.dart),
        ],
      ),
    );
  }

  Widget alertPrompt(BuildContext context) {
    return CardView(
      padding: EdgeInsets.symmetric(horizontal: 16.scale, vertical: 24.scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                color: textDarkColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.scale),
          BFTextField(hintText:hintText??"Please Input",value: value??"",onChanged:valueChanged,),
          SizedBox(height: 36.scale),
          Row(
            children: [
              UIFactory.textButton(
                  left ?? "NO",
                          () {
                        Navigator.pop(context,0);
                        if(leftAction!=null){
                          leftAction!();
                        }
                      },
                  width: 150.scale,
                  type: BtnType.light
              ),
              SizedBox(width: 16.scale),
              UIFactory.textButton(
                  right ?? "YES",
                      () {
                        Navigator.pop(context,1);
                        if(rightAction!=null){
                          rightAction!();
                        }
                      },
                  width: 150.scale,
                  type: BtnType.dart),
            ],
          )
        ],
      ),
    );
  }
}

