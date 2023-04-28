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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color _backgrounfColor = Colors.white;

  double smallFont = 24;
  double largeFont = 48;

  bool _isTapped = false;

  void _changeBackgroundColor() {
    setState(() {
      _backgrounfColor = widget._randomColorGenerator.generateRandomColours();
    });
  }

  void _onTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home_page_key"),
      backgroundColor: _backgrounfColor,
      body: InkWell(
        onTap: () {
          _changeBackgroundColor();
          _onTap();
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 500),
            style: TextStyle(
              fontSize: _isTapped ? largeFont : smallFont,
              color: _isTapped ? Colors.white : Colors.black,
            ),
            child: const Text(
              'Hello there!',
            ),
          ),
        ),
      ),
    );
  }
}
