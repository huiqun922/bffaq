import 'dart:convert';

import 'package:bfweb/utils/global.dart';
import 'package:bfweb/utils/ui/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'flutter_faq.dart';

class FAQView extends StatefulWidget {
  final String locale;
  const FAQView(this.locale, {super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  List<FAQModel> faqs = [];

  Future<void> loadJsonData() async {
    const supportedLocales = ['en', 'zh', 'de', 'it', 'nl', 'fr', 'es'];
    var locale = widget.locale;
    if (!supportedLocales.contains(locale)) {
      locale = 'en';
    }

    var jsonData = await rootBundle.loadString('assets/json/faq_$locale.json');
    final List<dynamic> jsonList = jsonDecode(jsonData);
    setState(() {
      faqs = jsonList
          .map((item) => FAQModel(item['q'] as String, item['a'] as String))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardView(
        padding: EdgeInsets.symmetric(horizontal: 8.scale),
        child: ListView.builder(
          itemCount: faqs.length,
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
          },
        ),
      ),
    );
  }
}

class FAQModel {
  String q;
  String a;
  FAQModel(this.q, this.a);
}
