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

  testWidgets('money: Conversion from USD to EUR Test',
      (WidgetTester tester) async {
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
