import 'package:flutter/material.dart';
import 'package:solid_software_test_app/data/random_color_generator.dart';

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

  final _luminanceLimit = 0.5;

  final _textScaleSmall = 1.0;
  final _textScaleLarge = 2.0;

  final _textSizeSmall = 14.0;
  final _textSizeLarge = 28.0;

  var _large = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home_page_key"),
      backgroundColor: _backgroundColor,
      body: InkWell(
        onTap: () {
          _changeBackgroundColor();
          _controlAnimation();
        },
        child: Center(
          child: AnimatedScale(
            scale: _large ? _textScaleSmall : _textScaleLarge,
            curve: Curves.elasticOut,
            duration: const Duration(seconds: 1),
            child: Text(
              'Hello there!',
              style: TextStyle(
                fontSize: _large ? _textSizeLarge : _textSizeSmall,
                color: _backgroundColor.computeLuminance() > _luminanceLimit
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = widget._randomColorGenerator.generateRandomColours();
    });
  }

  void _controlAnimation() => setState(() => _large = !_large);
}
