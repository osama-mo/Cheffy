import 'package:cheffy/screens/HomeScreen/widgets/random_meal_card.dart';
import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [RandomMealCard(), Row()],
    ));
  }
}
