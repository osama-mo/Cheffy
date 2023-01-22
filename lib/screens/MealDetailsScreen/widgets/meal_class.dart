import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String title;
  final String category;
  final String area;
  final String instructions;
  final List<String> ingredients;
  final List<String> measures;
  final String ytLink;
  final String img;

  const Meal(
      {required this.id,
      required this.title,
      required this.category,
      required this.area,
      required this.instructions,
      required this.ingredients,
      required this.measures,
      required this.ytLink,
      required this.img});

  factory Meal.fromJson(Map<String, dynamic> json) {
    var jsonmeal = json['meals'][0];
    List<String> ings = [];
    print(jsonmeal["strMealThumb"]);
    for (var i = 1; i < 21; i++) {
      if (jsonmeal['strIngredient$i'] == "") {
        break;
      } else {
        ings.add(jsonmeal['strIngredient$i']);
      }
    }
    List<String> meas = [];
    for (var i = 1; i < 21; i++) {
      if (jsonmeal['strMeasure$i'] == "") {
        break;
      } else {
        meas.add(jsonmeal['strMeasure$i']);
      }
    }
    return Meal(
        id: jsonmeal['idMeal'],
        title: jsonmeal['strMeal'],
        category: jsonmeal['strCategory'],
        area: jsonmeal['strArea'],
        instructions: jsonmeal['strInstructions'],
        ingredients: ings,
        measures: meas,
        ytLink: jsonmeal['strYoutube'],
        img: jsonmeal['strMealThumb']);
  }
}
