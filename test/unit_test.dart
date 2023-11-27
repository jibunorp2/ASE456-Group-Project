import 'dart:convert';

import 'package:ase456_group_project/screens/money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/button.dart';
import 'package:ase456_group_project/screens/simple.dart';
import 'package:ase456_group_project/screens/unit.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

http.Client httpClient = http.Client();

void main() {
  /* 
  ---------------------------------------------------------------------------------------
  SIMPLE.DART 
  ---------------------------------------------------------------------------------------
  */
  testWidgets('simple: Initial state of Simple widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text &&
            widget.data == '0' &&
            widget.style?.fontSize == 36,
      ),
      findsOneWidget,
    );
    expect(find.byType(MyButton), findsWidgets);
  });

  testWidgets('simple: test addition', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '+');
    await tapButton(tester, '3');
    await tapButton(tester, '4');
    await tapButton(tester, '=');

    expect(find.text('46.0'), findsOneWidget);
  });

  testWidgets('simple: test subtration', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('9.0'), findsOneWidget);
  });

  testWidgets('simple: test multiplication', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '*');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('36.0'), findsOneWidget);
  });

  testWidgets('simple: test division', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '/');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('4.0'), findsOneWidget);
  });

  testWidgets('simple: test decimal use', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '.');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('9.2'), findsOneWidget);
  });

  testWidgets('simple: test clear', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '.');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');
    await tapButton(tester, 'C');

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text &&
            widget.data == '0' &&
            widget.style?.fontSize == 36,
      ),
      findsOneWidget,
    );
  });

  /* 
  ---------------------------------------------------------------------------------------
  unit.DART 
  ---------------------------------------------------------------------------------------
  */
  testWidgets('unit: test density', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'DENSITY');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('4000'), findsOneWidget);
  });

  testWidgets('unit: 0 test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'ANGLE');
    await tester.enterText(textFieldFinder, '0');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('0'), findsAtLeast(2));
  });

  testWidgets('unit: large number', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'MASS');
    await tester.enterText(textFieldFinder,
        '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('2.0000000000000002e+175'), findsOneWidget);
  });

  testWidgets('unit: test second input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').last;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await drag(tester, 'AMOUNT_OF_SUBSTANCE', 'TEMPERATURE');
    await tapButton(tester, 'TEMPERATURE');
    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('40'), findsOneWidget);
  });

  /* 
  ---------------------------------------------------------------------------------------
  money.DART 
  WARNING: TESTS MAY BECOME OUT OF DATE IN THE EVENT OF ECONOMIC CHANGE
  ---------------------------------------------------------------------------------------
  */

  testWidgets('Conversion from USD to EUR Test', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'USD_EUR': 0.85,
      };
      return http.Response(json.encode(responseData), 200);
    });

    httpClient = mockClient;

    await tester.pumpWidget(
      MaterialApp(
        home: Money(),
      ),
    );

    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').last, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot('Amount'));

    // Reset the global variable to the original HTTP client
    httpClient = http.Client();
  });
}

Future<void> tapButton(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pumpAndSettle();
}

Future<void> drag(WidgetTester tester, String draggable, String item) async {
  await tester.dragUntilVisible(
    find.text(item),
    find.text(draggable).first,
    const Offset(0, -50),
  );
  await tester.pumpAndSettle();
}
