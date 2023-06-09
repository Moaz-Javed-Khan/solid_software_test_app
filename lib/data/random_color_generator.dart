import 'dart:math';

import 'package:flutter/material.dart';

/// Class for creating random colors
class RandomColorGenerator {
  final Random _random;

  /// Max value for random number generator
  final int _maxValue = 256;

  /// Constructor with a body to assign mock random value
  RandomColorGenerator({Random? random}) : _random = random ?? Random();

  /// This function generates random colors
  Color generateRandomColours() {
    return Color.fromRGBO(
      _generateRed(),
      _generateGreen(),
      _generateBlue(),
      1,
    );
  }

  /// Function for genetaring random number from 0 to 255 for Red of RGB
  int _generateRed() {
    return _random.nextInt(_maxValue);
  }

  /// Function for genetaring random number from 0 to 255 for Green of RGB
  int _generateGreen() {
    return _random.nextInt(_maxValue);
  }

  /// Function for genetaring random number from 0 to 255 for Blue of RGB
  int _generateBlue() {
    return _random.nextInt(_maxValue);
  }
}
