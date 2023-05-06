import 'package:flutter/material.dart';
import 'package:solid_software_test_app/presentation/home_page.dart';
import 'package:solid_software_test_app/utils/constants.dart';

/// Main class that will run when app is started
class App extends StatelessWidget {
  /// Constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: appKey,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
