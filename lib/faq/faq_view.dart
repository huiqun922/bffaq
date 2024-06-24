import 'dart:convert';
import 'dart:html';

import 'package:bfweb/utils/global.dart';
import 'package:bfweb/utils/size_fit.dart';
import 'package:bfweb/utils/text_utils.dart';
import 'package:bfweb/utils/ui/app_bar.dart';
import 'package:bfweb/utils/ui/card.dart';
import 'package:bfweb/utils/ui/listview_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'flutter_faq.dart';

class FAQView extends StatefulWidget {
  final String locale;
  const FAQView(this.locale, {super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FAQViewState();
  }
}

class _FAQViewState extends State<FAQView> {
  List<String> products = [];
  Map<String, dynamic> jsonMap = {};


  Future<void> loadJsonData() async {

    List<String>? locals = ['en','de','it','nl','fr','es'];
    String local = widget.locale;
    if(locals.contains(local) == false){
      local = 'en';
    }
    String jsonData =
    await rootBundle.loadString('assets/json/faq_$local.json'); // 替换成你的JSON文件路径
    jsonMap = jsonDecode(jsonData);
    setState(() {
      products = List.from(jsonMap.keys);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CardView(
        padding: EdgeInsets.symmetric(horizontal: 8.scale),
        child: ListView.builder(
            itemCount: products!.length,
            itemBuilder: (ctx, index) {
              return ListViewCell(
                title: products[index],
                click: () {
                  Route route = MaterialPageRoute(
                      builder: (ctx) => FAQViewDetail(
                        map: jsonMap[products[index]],
                      ));
                  Navigator.push(context, route);
                },
              );
            }),
      ),
    );
  }
}



class FAQViewDetail extends StatelessWidget {
  final List<dynamic> map;
  FAQViewDetail({super.key, this.map = const []});

  List faqs = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    setupFAQ();
    return Scaffold(
      body: CardView(
        padding: EdgeInsets.symmetric(horizontal: 8.scale),
        child: ListView.builder(
            itemCount: faqs!.length,
            itemBuilder: (ctx, index) {
              return FAQ(
                question: faqs[index].q,
                answer: faqs[index].a,
                ansPadding:
                EdgeInsets.symmetric(vertical: 10.scale, horizontal: 20),
                queStyle: TextUtils.mediumDartText(fontSize: 16),
                ansStyle: TextUtils.regularGrayText(fontSize: 14),
                queDecoration: const BoxDecoration(color: textWhiteColor),
                ansDecoration: const BoxDecoration(color: bgLightGrayColor),
              );
            }),
      ),
    );
  }

  void setupFAQ() {
    for (var element in map) {
      String key = element.keys.first;
      faqs.add(FAQModel(key,element[key]));
    }}
}

class FAQModel {
  String q;
  String a;
  FAQModel(this.q, this.a);
}
