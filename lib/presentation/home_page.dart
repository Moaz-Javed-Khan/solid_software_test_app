import 'package:flutter/material.dart';
import 'package:solid_software_test_app/data/random_colour_generator.dart';

/// This is the main page where random background color change can be seen
class HomePage extends StatefulWidget {
  final RandomColourGenerator _randomColourGenerator;

  /// Constructor
  HomePage({super.key, RandomColourGenerator? randomColourGenerator})
      : _randomColourGenerator =
            randomColourGenerator ?? RandomColourGenerator();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color _backgrounfColor = Colors.white;

  bool _isTapped = false;

  void _changeBackgroundColor() {
    setState(() {
      _backgrounfColor = widget._randomColourGenerator.generateRandomColours();
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
              fontSize: _isTapped ? 48 : 24, // increase font size when tapped
              color: _isTapped
                  ? Colors.orange
                  : Colors.black, // change text color when tapped
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
