import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Center(
      child: Text("THIS IS FAVORITES SCREEN"),
    ));
  }
}
