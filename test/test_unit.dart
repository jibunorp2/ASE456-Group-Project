import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/screens/unit.dart';

void main() {
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
  }, tags: 'unit');

  /*testWidgets('unit: 0 test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'ANGLE');
    await tester.enterText(textFieldFinder, '0');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('0'), findsAtLeast(2));
  }, tags: 'unit');*/

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
  }, tags: 'unit');

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
  }, tags: 'unit');
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
