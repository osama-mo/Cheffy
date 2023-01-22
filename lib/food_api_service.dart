import 'dart:convert';

import 'package:cheffy/screens/MealDetailsScreen/widgets/meal_class.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FoodApiService with ChangeNotifier {
  Future<Meal> getRandomMeal() async {
    Uri url = Uri.https("www.themealdb.com", "/api/json/v1/1/random.php");
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Meal.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Meal');
    }
  }
}
