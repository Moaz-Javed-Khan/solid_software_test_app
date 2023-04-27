import 'dart:math';

class RandomColourGenerator {
  final Random _random;

  ///
  RandomColourGenerator({Random? random}) : _random = random ?? Random();

  // int generateColour(){
  //   return
  // }

  int generateRed() {
    return _random.nextInt(256);
  }

  int generateGreen() {
    return _random.nextInt(256);
  }

  int generateBlue() {
    return _random.nextInt(256);
  }
}
