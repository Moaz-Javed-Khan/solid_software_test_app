import 'package:flutter/material.dart';
import 'package:solid_software_test_app/data/random_colour_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.white;

  RandomColourGenerator rand = RandomColourGenerator();

  void changeBackgroundColor() {
    setState(() {
      backgroundColor = Color.fromRGBO(
        rand.generateRed(),
        rand.generateGreen(),
        rand.generateBlue(),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          changeBackgroundColor();
        },
        child: ColoredBox(
          color: backgroundColor,
          child: const Center(
            child: Text(
              'Hello there',
            ),
          ),
        ),
      ),
    );
  }
}
