import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/button.dart';
import 'package:ase456_group_project/screens/simple.dart';

void main() {
  testWidgets('Initial state of Simple widget', (WidgetTester tester) async {
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

  testWidgets('test addition', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '+');
    await tapButton(tester, '3');
    await tapButton(tester, '4');
    await tapButton(tester, '=');

    expect(find.text('46.0'), findsOneWidget);
  });

  testWidgets('test subtration', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('9.0'), findsOneWidget);
  });

  testWidgets('test multiplication', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '*');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('36.0'), findsOneWidget);
  });

  testWidgets('test division', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Simple()));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '/');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('4.0'), findsOneWidget);
  });

  testWidgets('test decimal use', (WidgetTester tester) async {
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

  testWidgets('test clear', (WidgetTester tester) async {
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
}

Future<void> tapButton(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pump();
}