import 'package:bfweb/faq/user_tips.dart';
import 'package:flutter/material.dart';
import 'faq/faq_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BF Home',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      const Color(0x12666666)))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      const Color(0x12666666))))),
      initialRoute: '/faq',
      routes: {
        '/faq': (context) => const FAQView('en'),
        '/tips': (context) => const UserTipsView(false, 'en'),
        '/tips5': (context) => const UserTipsView(true, 'en'),
      },
      onGenerateRoute: (RouteSettings settings) {
        var url = settings.name ?? '';
        var uri = Uri.parse(url.replaceFirst('#/', ''));
        var locale = uri.queryParameters['locale'] ?? 'en';
        if (settings.name?.contains('tips5') == true) {
          return MaterialPageRoute(
              builder: (context) => UserTipsView(true, locale));
        }
        if (settings.name?.contains('tips') == true) {
          return MaterialPageRoute(
              builder: (context) => UserTipsView(false, locale));
        }
        return MaterialPageRoute(builder: (context) => FAQView(locale));
      },
    );
  }
}
