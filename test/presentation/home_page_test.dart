import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software_test_app/data/random_colour_generator.dart';
import 'package:solid_software_test_app/presentation/home_page.dart';

class MockRandomColourGenerator extends Mock implements RandomColourGenerator {}

void main() {
  testWidgets(
    'Testing widgets',
    (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );
      expect(find.byKey(const Key("home_page_key")), findsOneWidget);

      // Verifing inkwell widget
      final inkwell = find.byType(InkWell);
      expect(inkwell, findsOneWidget);
      // await tester.tap(inkwell);
      // await tester.pump();

      // Verify that the Centerwidget is created
      final center = find.byType(Center);
      expect(center, findsOneWidget);

      // Verify that the Text widget is created
      final text = find.byType(Text);
      expect(text, findsOneWidget);

      // Verify that the initial text is 'Hello there'
      expect(tester.widget<Text>(find.byType(Text)).data, 'Hello there');
    },
  );

  testWidgets(
    'Testing tap',
    (WidgetTester tester) async {
      final RandomColourGenerator randomColourGenerator =
          MockRandomColourGenerator();

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(
            randomColourGenerator: randomColourGenerator,
          ),
        ),
      );
      expect(find.byKey(const Key("home_page_key")), findsOneWidget);

      // Verifing inkwell widget
      final inkwell = find.byType(InkWell);
      expect(inkwell, findsOneWidget);
      await tester.tap(inkwell);
      await tester.pump();
    },
  );
}
