import 'package:cheffy/food_api_service.dart';
import 'package:cheffy/provider/food_api_functions.dart';
import 'package:cheffy/screens/SearchScreen/widgets/search_item.dart';
import 'package:flutter/material.dart';

import '../../MealDetailsScreen/widgets/meal_class.dart';

class CategoryListMeals extends StatefulWidget {
  final String type;
  final String title;
  const CategoryListMeals({super.key, required this.title, required this.type});
  @override
  _CategoryListMealsState createState() => _CategoryListMealsState();
}

class _CategoryListMealsState extends State<CategoryListMeals> {
  late Future<List<Meal>> futuremeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.black.withOpacity(.5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FoodApiService().getcategoryFood(widget.title, widget.type),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == 0
                ? const Center(
                    child: Text(
                      "No Results!",
                      style: TextStyle(fontSize: 32.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchItem(meal: snapshot.data[index]);
                    },
                  );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
