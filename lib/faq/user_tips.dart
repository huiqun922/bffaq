import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/global.dart';
import '../../../utils/ui/card.dart';

class UserTipsView extends StatefulWidget{
  final bool isBf5;
  final String locale;
  const UserTipsView(this.isBf5,this.locale,{super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GrillUserTipsState();
  }

}

class _GrillUserTipsState extends State<UserTipsView> {

  Map<String, dynamic> jsonMap = {};
  String tipsKey = '';

  Future<void> loadJsonData() async {

    List<String>? locals = ['en','de','it','nl','fr','es'];
    String local = widget.locale ?? '';
    if(locals.contains(local) == false){
      local = 'en';
    }
    String jsonData =
    await rootBundle.loadString('assets/json/tips_$local.json'); // 替换成你的JSON文件路径
    jsonMap = jsonDecode(jsonData);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tipsKey = widget.isBf5?'tips5':'tips';
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: bgColor,
        body: CardView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(jsonMap[tipsKey] ?? '',style: TextUtils.regularDartText(),),
                Text('\n',style: TextUtils.regularDartText(),),
                Text(jsonMap['red'] ?? '',style: TextUtils.regularDartText(textColor: Colors.red,fontSize: 14),),
              ],
            ),
          ),
        ));
  }
}