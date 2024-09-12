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

  testWidgets('unit: test angle', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'ANGLE');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('2400'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test area', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'AREA');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('1618.74256896'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test energy', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'ENERGY');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('1.045278106482728e+21'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test micromoles to moles', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'femtomoles');
    await tapButton(tester, 'moles');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('0.000039999999999999996'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test length: inches to feet', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'LENGTH');
    await tapButton(tester, 'angstroms');
    await tapButton(tester, 'inches');
    await tapButton(tester, 'astronomicalUnits');
    await tapButton(tester, 'feet');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('3.3333333333333335'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test fuel_consumption: mpg(us) to mpg(imp)',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await tapButton(tester, 'FUEL_CONSUMPTION');
    await tapButton(tester, 'kilometersPerLiter');
    await tapButton(tester, 'milesPerUsGallon');
    await tapButton(tester, 'litersPer100km');
    await tapButton(tester, 'milesPerImperialGallon');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('48.03799702147525'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test speed: knots to mph', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await drag(tester, 'AMOUNT_OF_SUBSTANCE', 'SPEED');
    await tapButton(tester, 'SPEED');
    await tapButton(tester, 'feetsPerSecond');
    await tapButton(tester, 'knots');
    await tapButton(tester, 'kilometersPerHour');
    await tapButton(tester, 'milesPerHour');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('46.031177920941694'), findsOneWidget);
  }, tags: 'unit');

  testWidgets('unit: test time: minutes to seconds',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Unit()));
    Finder textFieldFinder = find.widgetWithText(TextField, 'Amount').first;

    await tapButton(tester, 'AMOUNT_OF_SUBSTANCE');
    await drag(tester, 'AMOUNT_OF_SUBSTANCE', 'TIME');
    await tapButton(tester, 'TIME');
    await tapButton(tester, 'centiseconds');
    await drag(tester, 'centiseconds', 'minutes');
    await tapButton(tester, 'minutes');
    await tapButton(tester, 'centuries');
    await drag(tester, 'centuries', 'seconds');
    await tapButton(tester, 'seconds');
    await tester.enterText(textFieldFinder, '40');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.textContaining('2400'), findsOneWidget);
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
