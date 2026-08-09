import 'package:bfweb/faq/faq_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FAQ view renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FAQView('en')));
    await tester.pumpAndSettle();
    expect(find.text('My device cannot connect to WiFi. What should I do?'),
        findsOneWidget);
  });
}
