// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hn_app/main.dart';

void main() {
  testWidgets('refresh clears open state', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    expect(find.byIcon(Icons.launch), findsNothing);

    await tester.tap(find.byType(ExpansionTile).at(2));
    await tester.pump();

    expect(find.byIcon(Icons.launch), findsOneWidget);

    await tester.drag(
        find.byType(ExpansionTile).first, const Offset(0.0, 150.0));
    await tester.pumpAndSettle(const Duration(days: 9));

    // debugDumpApp();
    expect(find.byType(RefreshProgressIndicator), findsNothing);
    expect(find.byIcon(Icons.launch), findsNothing);
  });
}
