import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/button.dart';
import 'package:ase456_group_project/screens/simple.dart';

void main() {
  /* 
  ---------------------------------------------------------------------------------------
  simple.dart 
  ---------------------------------------------------------------------------------------
  */
  testWidgets('simple: Initial state of Simple widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

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
  }, tags: 'simple');

  testWidgets('simple: test addition', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '+');
    await tapButton(tester, '3');
    await tapButton(tester, '4');
    await tapButton(tester, '=');

    expect(find.text('46.0'), findsOneWidget);
  }, tags: 'simple');

  testWidgets('simple: test subtration', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('9.0'), findsOneWidget);
  }, tags: 'simple');

  testWidgets('simple: test multiplication', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '*');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('36.0'), findsOneWidget);
  }, tags: 'simple');

  testWidgets('simple: test division', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '/');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('4.0'), findsOneWidget);
  }, tags: 'simple');

  testWidgets('simple: test decimal use', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '.');
    await tapButton(tester, '2');
    await tapButton(tester, '-');
    await tapButton(tester, '3');
    await tapButton(tester, '=');

    expect(find.text('9.2'), findsOneWidget);
  }, tags: 'simple');

  testWidgets('simple: test clear', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Simple(
      buttonColor: Colors.blue,
    )));

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
  }, tags: 'simple');
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
