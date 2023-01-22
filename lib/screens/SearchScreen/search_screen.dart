import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Center(
      child: Text("THIS IS Search SCREEN"),
    ));
  }
}
