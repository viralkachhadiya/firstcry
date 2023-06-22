import 'package:demo_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Flutter Widget Test",  (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Flutter Devs');
    expect(find.text('Flutter Devs'), findsOneWidget);
    print('Flutter Devs');
    var button = find.text("Reverse Text");
    expect(button,findsOneWidget);
    print('Reverse Text');
    await tester.tap(button);
    await tester.pump();
    expect(find.text("sveD rettulF"),findsOneWidget);
    print('sveD rettulF');
  });
}