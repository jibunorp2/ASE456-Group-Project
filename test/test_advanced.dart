import 'package:ase456_group_project/screens/advanced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/button.dart';

void main() {
  testWidgets('advanced: Test basic functions', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '+');
    await tapButton(tester, '3');
    await tapButton(tester, '4');
    await tapButton(tester, '=');

    expect(find.text('46.0'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: Clear input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '3');
    await tapButton(tester, '4');
    await tapButton(tester, 'C');
    await tapButton(tester, '3');
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
    expect(find.byType(MyButton), findsWidgets);
  }, tags: 'advanced');

  testWidgets('advanced: Negative number test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '±');
    expect(find.text('-12'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: log test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, 'log');
    await tapButton(tester, '9');
    await tapButton(tester, '8');
    await tapButton(tester, '=');

    expect(find.text('1.9912260756924949'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: constants test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, 'pi');
    expect(find.text('3.141592653589793'), findsOneWidget);
    await tapButton(tester, 'C');
    await tapButton(tester, 'e');
    expect(find.text('2.718281828459045'), findsOneWidget);
    await tapButton(tester, 'C');
    await tapButton(tester, '\u03C6');
    expect(find.text('1.618033988749895'), findsOneWidget);
    await tapButton(tester, 'C');
    await tapButton(tester, 'ln2');
    expect(find.text('0.6931471805599453'), findsOneWidget);
    await tapButton(tester, 'C');
    await tapButton(tester, 'sqrt(1/2)');
    expect(find.text('0.7071067811865476'), findsOneWidget);
    await tapButton(tester, 'C');
    await tapButton(tester, 'ln');
    expect(find.text('-Infinity'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: ln', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '8');
    await tapButton(tester, '9');
    await tapButton(tester, 'ln');

    expect(find.text('4.48863636973214'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: absolute value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, '±');
    expect(find.text('-12'), findsOneWidget);
    await tapButton(tester, '|x|');
    await tester.pumpAndSettle();
    expect(find.textContaining('| = 12'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: cubed root', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '\u221B');
    await tapButton(tester, '8');
    await tapButton(tester, '=');

    expect(find.text('\u221B(8) = 2.0000000000000000'), findsOneWidget);
  }, tags: 'advanced');

  /*testWidgets('advanced: using functions in tandem', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AdvancedCalculator(buttonColor: Colors.blue,)));

    await tapButton(tester, '8');
    await tapButton(tester, 'sqrt(1/2)');
    await tapButton(tester, '+');
    await tapButton(tester, '8');
    await tapButton(tester, 'exp');
    await tapButton(tester, '=');

    expect(find.text('5.859874482048838'), findsOneWidget);
  }, tags: 'advanced');*/

  testWidgets('advanced: ln ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '4');
    await tapButton(tester, 'ln');

    expect(find.text('1.3862943611198906'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: x cubed ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '2');
    await tapButton(tester, 'x³');

    expect(find.textContaining('³ = 8'), findsOneWidget);
  }, tags: 'advanced');

  testWidgets('advanced: exp ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AdvancedCalculator(
      buttonColor: Colors.blue,
    )));

    await tapButton(tester, '2');
    await tapButton(tester, 'exp');

    expect(find.textContaining('7.38905609893065'), findsOneWidget);
  }, tags: 'advanced');
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
