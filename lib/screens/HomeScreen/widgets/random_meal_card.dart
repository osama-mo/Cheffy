import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';

class RandomMealCard extends StatelessWidget {
  const RandomMealCard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/imgs/thinking-face.gif",
              scale: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Column(
                children: [
                  const Text("Want to get a random meal?"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MealDetailsScreen();
                        }));
                      },
                      child: const Text("Try Your luck!"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
