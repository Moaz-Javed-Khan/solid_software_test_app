import 'dart:math';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software_test_app/data/random_colour_generator.dart';

class MockRandom extends Mock implements Random {}

void main() {
  final Random random = MockRandom();
  final randomColourGenerator = RandomColourGenerator(random: random);
  const int mockRandomValue = 5;
  const Color matcherValue = Color.fromRGBO(5, 5, 5, 1);

  group("Testing random color generator", () {
    when(() => random.nextInt(any())).thenReturn(mockRandomValue);

    test("Test for generateR", () {
      final Color result = randomColourGenerator.generateRandomColours();

      expect(result, matcherValue);
    });
  });
}
