import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software_test_app/data/random_colour_generator.dart';

class MockRandom extends Mock implements Random {}

void main() {
  final Random random = MockRandom();
  final randomColourGenerator = RandomColourGenerator(random: random);

  group("Testing random number generator", () {
    when(() => random.nextInt(any())).thenReturn(5);

    test("Test for generateR", () {
      final int result = randomColourGenerator.generateRed();

      expect(result, 5);
    });

    test("Test for generateG", () {
      final int result = randomColourGenerator.generateGreen();

      expect(result, 5);
    });

    test("Test for generateB", () {
      final int result = randomColourGenerator.generateBlue();

      expect(result, 5);
    });
  });
}
