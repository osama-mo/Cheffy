import 'package:cheffy/food_api_service.dart';
import 'package:cheffy/provider/food_api_functions.dart';
import 'package:cheffy/screens/HomeScreen/widgets/logo_card.dart';
import 'package:cheffy/screens/HomeScreen/widgets/meals_row_list.dart';
import 'package:cheffy/screens/HomeScreen/widgets/random_meal_card.dart';
import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LogoCard(),
          const RandomMealCard(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Check out Some Egyptian food",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          MealsRowList(
            type: "Area",
            header: "Check out Some Egyptian food",
            title: "Egyptian",
            futuremealsfunction: FoodApiService().getcategoryFood,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Some Recpies which you can make with Chicken!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          MealsRowList(
            type: "Ingredients",
            header: "Check out Some Egyptian food",
            title: "chicken_breast",
            futuremealsfunction: FoodApiService().getcategoryFood,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Take a look at these Indian Recpies!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          MealsRowList(
            type: "Area",
            header: "Take a look at these Indian Recpies!",
            title: "Indian",
            futuremealsfunction: FoodApiService().getcategoryFood,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Some Recpies which you can make with Rice!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          MealsRowList(
            header: "Check out Some Egyptian food",
            type: "Ingredients",
            title: "Rice",
            futuremealsfunction: FoodApiService().getcategoryFood,
          )
        ],
      ),
    ));
  }
}
