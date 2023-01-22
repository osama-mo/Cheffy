import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: const Center(
      child: Text("THIS IS Settings SCREEN"),
    ));
  }
}
