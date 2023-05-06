import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software_test_app/data/random_color_generator.dart';
import 'package:solid_software_test_app/presentation/home_page.dart';
import 'package:solid_software_test_app/utils/constants.dart';

class MockRandomColorGenerator extends Mock implements RandomColorGenerator {}

void main() {
  testWidgets(
    'HomePage Widget',
    (WidgetTester tester) async {
      // Render the widget
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );
      expect(find.byKey(homePageKey), findsOneWidget);

      // Verifing inkwell widget
      final inkwell = find.byType(InkWell);
      expect(inkwell, findsOneWidget);

      // Verify that the Centerwidget is created
      final center = find.byType(Center);
      expect(center, findsOneWidget);

      // Verify that the Text widget is created
      final text = find.byType(Text);
      expect(text, findsOneWidget);

      // Verify that the initial text is 'Hello there'
      expect(tester.widget<Text>(find.byType(Text)).data, helloThereText);
    },
  );

  testWidgets(
    'On Tap background',
    (WidgetTester tester) async {
      final randomColorGenerator = MockRandomColorGenerator();

      when(() => randomColorGenerator.generateRandomColours())
          .thenReturn(Colors.white);

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(
            randomColorGenerator: randomColorGenerator,
          ),
        ),
      );
      expect(find.byKey(homePageKey), findsOneWidget);

      // Verifing inkwell widget
      final inkwell = find.byType(InkWell);
      expect(inkwell, findsOneWidget);
      await tester.tap(inkwell);
      await tester.pump();

      verify(() => randomColorGenerator.generateRandomColours()).called(1);
    },
  );
}
