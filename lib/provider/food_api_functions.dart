import 'package:flutter/cupertino.dart';

import '../screens/MealDetailsScreen/widgets/meal_class.dart';

class FoodApiFunc with ChangeNotifier {
  List<Meal> listfromJson(Map<String, dynamic> json) {
    List<String> ings;
    List<String> meas;
    int indexo = 0;
    List<Meal> meals = [];
    // ignore: prefer_typing_uninitialized_variables

    Meal meal;
    var jsonmeals = json['meals'];
    for (var jsonmeal in json['meals']) {
      ings = [];
      meas = [];
      for (var i = 1; i < 21; i++) {
        if (jsonmeal['strIngredient$i'] == "") {
          break;
        } else {
          ings.add(jsonmeal['strIngredient$i']);
        }
      }

      for (var i = 1; i < 21; i++) {
        if (jsonmeal['strMeasure$i'] == "") {
          break;
        } else {
          meas.add(jsonmeal['strMeasure$i']);
        }
      }
      meals.add(Meal(
          id: jsonmeal['idMeal'],
          title: jsonmeal['strMeal'],
          category: jsonmeal['strCategory'],
          area: jsonmeal['strArea'],
          instructions: jsonmeal['strInstructions'],
          ingredients: ings,
          measures: meas,
          ytLink: jsonmeal['strYoutube'],
          img: jsonmeal['strMealThumb']));
      indexo++;
    }

    return meals;
  }
}
