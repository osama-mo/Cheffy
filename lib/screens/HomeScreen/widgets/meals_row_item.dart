// ignore_for_file: prefer_const_constructors

import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../food_api_service.dart';
import '../../MealDetailsScreen/widgets/meal_class.dart';

class MealsRowItem extends StatelessWidget {
  final Meal meal;
  const MealsRowItem({super.key, required this.meal});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MealDetailsScreen(
            futuremealfunction: FoodApiService().getMealDetails,
            param: meal.id,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.network(
                meal.img,
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  width: 150,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    meal.title,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
