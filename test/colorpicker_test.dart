import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/screens/home.dart';
import 'package:ase456_group_project/ui_elements/color_picker.dart';

void main() {
  testWidgets('Open and Test Color Picker', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ColorPickerButton(
            onColorSelected: (color) {
              expect(color, isA<Color>());
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.color_lens));
    await tester.pumpAndSettle();

    expect(find.text('Pick a color'), findsOneWidget);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
  });
}
