import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ase456_group_project/ui_elements/color_picker.dart';
import 'package:ase456_group_project/screens/home.dart';

void main() {
  testWidgets('Testing ColorPickerButton', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Find the ColorPickerButton by type
    expect(find.byType(ColorPickerButton), findsOneWidget);

    // Tap the ColorPickerButton
    await tester.tap(find.byType(ColorPickerButton));
    // Add a short delay after tapping
    await tester.pump();

    // Verify the presence of the color picker dialog by looking for a specific text
    expect(find.text('Pick a color'), findsOneWidget);

    // Ensure there are two buttons in the dialog: 'Cancel' and 'Done'
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    // You can perform more specific assertions based on your color picker implementation
  });
}