import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_software_test_app/presentation/app.dart';

void main() {
  testWidgets(
    'App Widget',
    (WidgetTester tester) async {
      // Render the widget
      await tester.pumpWidget(
        const App(),
      );
      expect(find.byKey(const Key("app_key")), findsOneWidget);
    },
  );
}
