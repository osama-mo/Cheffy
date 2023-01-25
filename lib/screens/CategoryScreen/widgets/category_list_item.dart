// ignore_for_file: prefer_const_constructors

import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../food_api_service.dart';
import '../../MealDetailsScreen/widgets/meal_class.dart';
import '../categories_list.dart';
import 'category_list_meals.dart';

class CategoryListItem extends StatelessWidget {
  final String title;
  final String type;
  const CategoryListItem({super.key, required this.title, required this.type});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryListMeals(title: title, type: type);
        }));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        color: Color.fromARGB(255, 44, 44, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: const TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
