// ignore_for_file: prefer_const_constructors

/*
Important commands:
flutter test
- runs all test

flutter test --plain-name '{description of test}'
- runs specific test based on description name
*/
import 'package:flutter_test/flutter_test.dart';
import 'test_advanced.dart' as test_advanced;
import 'test_money.dart' as test_money;
import 'test_scientific.dart' as test_scientific;
import 'test_simple.dart' as test_simple;
import 'test_unit.dart' as test_unit;

void main() {
  test_advanced.main();
  test_money.main();
  test_scientific.main();
  test_simple.main();
  test_unit.main();
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
