import 'package:ase456_group_project/screens/scientific.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('scientific: Test angle mode selection',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Radians').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Radians'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: sqrt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '9');
    await tapButton(tester, '\u{221A}');
    expect(find.textContaining('3'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: ^', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '3');
    await tapButton(tester, '^');
    await tapButton(tester, '4');
    await tapButton(tester, '=');
    expect(find.textContaining('8'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: ^2', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '3');
    await tapButton(tester, '^2');
    await tapButton(tester, '=');
    expect(find.text('9'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: 1/x', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '1/x');
    await tapButton(tester, '2');
    await tapButton(tester, '=');
    expect(find.text('0.5'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: sqrt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '\u{221A}');
    await tapButton(tester, '2');
    await tapButton(tester, '5');
    await tapButton(tester, '=');
    expect(find.text('5'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: %', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '6');
    await tapButton(tester, '%');
    await tapButton(tester, '5');
    await tapButton(tester, '=');
    expect(find.text('1'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: x sqrt y', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    await tapButton(tester, '4');
    await tapButton(tester, 'x\u{221A}y');
    await tapButton(tester, '5');
    await tapButton(tester, '=');
    expect(find.textContaining('1.319'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: sin in radians', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'sin');
    expect(find.text('sin('), findsOneWidget);
    await tapButton(tester, '4');
    await tapButton(tester, '5');
    expect(find.text('sin(45'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.text('0.8509035245341184'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: sin in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'sin');
    expect(find.text('sin('), findsOneWidget);
    await tapButton(tester, '4');
    await tapButton(tester, '5');
    expect(find.text('sin(45'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.7071'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: cos in radians', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'cos');
    expect(find.text('cos('), findsOneWidget);
    await tapButton(tester, '4');
    await tapButton(tester, '5');
    expect(find.text('cos(45'), findsOneWidget);
    await tapButton(tester, '=');

    expect(find.textContaining('0.5253'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: cos in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'cos');
    expect(find.text('cos('), findsOneWidget);
    await tapButton(tester, '3');
    await tapButton(tester, '5');
    expect(find.text('cos(35'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.8191'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: tan in radians', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'tan');
    expect(find.text('tan('), findsOneWidget);
    await tapButton(tester, '4');
    await tapButton(tester, '5');
    expect(find.text('tan(45'), findsOneWidget);
    await tapButton(tester, '=');

    expect(find.textContaining('1.619'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: tan in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'tan');
    expect(find.text('tan('), findsOneWidget);
    await tapButton(tester, '3');
    await tapButton(tester, '5');
    expect(find.text('tan(35'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.70020'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: asin in radians', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'asin');
    expect(find.text('asin('), findsOneWidget);
    await tapButton(tester, '1');
    expect(find.text('asin(1'), findsOneWidget);
    await tapButton(tester, '=');

    expect(find.textContaining('1.5707'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: asin in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'asin');
    expect(find.text('asin('), findsOneWidget);
    await tapButton(tester, '1');
    expect(find.text('asin(1'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.01745'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: acos in radians', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'acos');
    expect(find.text('acos('), findsOneWidget);
    await tapButton(tester, '0');
    await tapButton(tester, '.');
    await tapButton(tester, '3');
    expect(find.text('acos(0.3'), findsOneWidget);
    await tapButton(tester, '=');

    expect(find.textContaining('1.26610'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: acos in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'acos');
    expect(find.text('acos('), findsOneWidget);
    await tapButton(tester, '3');
    await tapButton(tester, '5');
    expect(find.text('acos(35'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.9136'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: atan', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );
    //radians
    await tapButton(tester, 'atan');
    expect(find.text('atan('), findsOneWidget);
    await tapButton(tester, '4');
    await tapButton(tester, '5');
    expect(find.text('atan(45'), findsOneWidget);
    await tapButton(tester, '=');

    expect(find.textContaining('1.5485'), findsOneWidget);
  }, tags: 'scientific');

  testWidgets('scientific: atan in degrees', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScientificCalculator(buttonColor: Colors.blue),
        ),
      ),
    );

    expect(find.textContaining('Radians'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<AngleMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Degrees').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Degrees'), findsOneWidget);

    await tapButton(tester, 'atan');
    expect(find.text('atan('), findsOneWidget);
    await tapButton(tester, '3');
    await tapButton(tester, '5');
    expect(find.text('atan(35'), findsOneWidget);
    await tapButton(tester, '=');
    expect(find.textContaining('0.54837'), findsOneWidget);
  }, tags: 'scientific');
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
