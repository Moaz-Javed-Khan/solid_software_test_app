import 'dart:math';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software_test_app/data/random_color_generator.dart';

class MockRandom extends Mock implements Random {}

void main() {
  final Random random = MockRandom();
  final randomColorGenerator = RandomColorGenerator(random: random);
  const int mockRandomValue = 5;
  const Color matcherValue = Color.fromRGBO(5, 5, 5, 1);

  group("RandomColorGenerator", () {
    when(() => random.nextInt(any())).thenReturn(mockRandomValue);

    test("generateRandomColours()", () {
      final Color result = randomColorGenerator.generateRandomColours();

      expect(result, matcherValue);
    });
  });
}
