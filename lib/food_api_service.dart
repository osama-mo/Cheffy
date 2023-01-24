import 'dart:convert';

import 'package:cheffy/screens/MealDetailsScreen/widgets/meal_class.dart';
import 'package:cheffy/provider/food_api_functions.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FoodApiService with ChangeNotifier {
  Future<Meal> getRandomMeal(String id) async {
    Uri url = Uri.https("www.themealdb.com", "/api/json/v1/1/random.php");
    final response = await http.get(url);
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

  Future<Meal> getMealDetails(String id) async {
    final queryParameters = {
      'i': id,
    };
    Uri url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/lookup.php", queryParameters);
    final response = await http.get(url);
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

  Future<List<Meal>> getAreaFood(String area) async {
    final queryParameters = {
      'a': area,
    };
    Uri url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/filter.php", queryParameters);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return FoodApiFunc().listfromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Meals');
    }
  }

  Future<List<Meal>> getMainIngFood(String ing) async {
    final queryParameters = {
      'i': ing,
    };
    Uri url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/filter.php", queryParameters);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return FoodApiFunc().listfromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Meals');
    }
  }

  Future<List<Meal>> getSearchResults(String serachTerm) async {
    final queryParameters = {
      's': serachTerm,
    };
    Uri url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/search.php", queryParameters);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return FoodApiFunc().listfromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Meals');
    }
  }
}
