import 'dart:convert';
import 'package:ase456_group_project/screens/money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

http.Client httpClient = http.Client();

void main() {
  /* 
  ---------------------------------------------------------------------------------------
  money.dart
  WARNING: TESTS MAY BECOME OUT OF DATE IN THE EVENT OF ECONOMIC CHANGE
  ---------------------------------------------------------------------------------------
  */

  testWidgets('money: Conversion from USD to EUR', (WidgetTester tester) async {
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

    httpClient = http.Client();
  }, tags: 'money');

  testWidgets('money: Conversion from AUD to EUR', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'AUD_EUR': 0.611775,
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

    await tapButton(tester, 'USD');
    await tapButton(tester, 'AUD');
    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').last, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot('Amount'));

    httpClient = http.Client();
  }, tags: 'money');

  testWidgets('money: Conversion from AED to EUR', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'AUD_EUR': 0.251707,
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

    await tapButton(tester, 'USD');
    await drag(tester, 'USD', 'AED');
    await tapButton(tester, 'AED');
    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').last, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot('Amount'));

    httpClient = http.Client();
  }, tags: 'money');

  testWidgets('money: Conversion from HKD to CAD', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'HKD_CAD': 0.17313,
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

    await tapButton(tester, 'USD');
    await drag(tester, 'USD', 'HKD');
    await tapButton(tester, 'HKD');
    await tapButton(tester, 'EUR');
    await tapButton(tester, 'CAD');
    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').last, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot('Amount'));

    httpClient = http.Client();
  }, tags: 'money');

  testWidgets('money: Conversion from AED to RUB', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'AUD_EUR': 24.889123,
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

    await tapButton(tester, 'USD');
    await drag(tester, 'USD', 'AED');
    await tapButton(tester, 'AED');
    await tapButton(tester, 'EUR');
    await drag(tester, 'EUR', 'RUB');
    await tapButton(tester, 'RUB');
    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').last, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').last, isNot('Amount'));

    httpClient = http.Client();
  }, tags: 'money');

  testWidgets('money: Test second input', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      final Map<String, dynamic> responseData = {
        'EUR_USD': 1.081841,
      };
      return http.Response(json.encode(responseData), 200);
    });

    httpClient = mockClient;

    await tester.pumpWidget(
      MaterialApp(
        home: Money(),
      ),
    );

    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').last;

    await tester.enterText(textFieldFinder, '90');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Amount').first, isNot('0'));
    expect(find.widgetWithText(TextField, 'Amount').first, isNot(''));
    expect(find.widgetWithText(TextField, 'Amount').first, isNot('Amount'));

    httpClient = http.Client();
  }, tags: 'money');
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
