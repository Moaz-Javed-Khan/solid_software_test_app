import 'package:flutter/material.dart';
import 'package:solid_software_test_app/data/random_color_generator.dart';
import 'package:solid_software_test_app/utils/constants.dart';

/// Home page where random background color change can be seen
class HomePage extends StatefulWidget {
  final RandomColorGenerator _randomColorGenerator;

  /// Constructor of Home page where random background color change can be seen
  HomePage({super.key, RandomColorGenerator? randomColorGenerator})
      : _randomColorGenerator = randomColorGenerator ?? RandomColorGenerator();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = Colors.white;

  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homePageKey,
      backgroundColor: _backgroundColor,
      body: InkWell(
        onTap: () {
          _changeBackgroundColor();
          _controlAnimation();
        },
        child: AnimatedText(
          isLarge: _isLarge,
          luminance: _backgroundColor.computeLuminance(),
        ),
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = widget._randomColorGenerator.generateRandomColours();
    });
  }

  void _controlAnimation() => setState(() => _isLarge = !_isLarge);
}

///Used to animate text
class AnimatedText extends StatefulWidget {
  ///Variable to check text Size
  final bool isLarge;

  ///Variable to check background color luminance
  final double luminance;

  ///Constructor of AnimatedText
  const AnimatedText({
    super.key,
    required this.isLarge,
    required this.luminance,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  final _luminanceLimit = 0.5;

  final _textScaleSmall = 1.0;
  final _textScaleLarge = 2.0;

  final _textSizeSmall = 14.0;
  final _textSizeLarge = 28.0;

  Color get _textColor =>
      widget.luminance > _luminanceLimit ? Colors.black : Colors.white;

  double get _fontSize => widget.isLarge ? _textSizeLarge : _textSizeSmall;

  double get _scale => widget.isLarge ? _textScaleSmall : _textScaleLarge;

  Duration get _duration => const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: _scale,
        curve: Curves.elasticOut,
        duration: _duration,
        child: Text(
          helloThereText,
          style: TextStyle(fontSize: _fontSize, color: _textColor),
        ),
      ),
    );
  }
}
