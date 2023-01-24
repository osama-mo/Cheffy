// ignore_for_file: prefer_const_constructors

import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../food_api_service.dart';
import '../../MealDetailsScreen/widgets/meal_class.dart';

class SearchItem extends StatelessWidget {
  final Meal meal;
  const SearchItem({super.key, required this.meal});

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
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.network(
                meal.img,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      meal.title,
                      style: const TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.category,
                            color: Colors.white,
                          ),
                          Text(
                            "  Category: ${meal.category}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        Text(
                          "  Area: ${meal.area}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
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
