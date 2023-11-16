import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/button.dart';
import 'package:ase456_group_project/screens/simple.dart';
import 'package:ase456_group_project/screens/unit.dart';

void main() {
  /* 
  ---------------------------------------------------------------------------------------
  SIMPLE.DART 
  ---------------------------------------------------------------------------------------
  */
  testWidgets('simple: Initial state of Simple widget', (WidgetTester tester) async {
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
    await tester.pump();
    await tester.enterText(textFieldFinder, '40');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.text('4000'), findsOneWidget);
  });
}

Future<void> tapButton(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pump();
}
