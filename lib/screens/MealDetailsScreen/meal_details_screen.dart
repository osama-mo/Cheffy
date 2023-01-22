import 'dart:ui';

import 'package:cheffy/screens/HomeScreen/widgets/random_meal_card.dart';
import 'package:cheffy/screens/MealDetailsScreen/widgets/meal_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../food_api_service.dart';
import '../../widgets/background.dart';
import 'widgets/bottom_sheet_info.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late Future<Meal> futuremeal;

  @override
  void initState() {
    super.initState();
    futuremeal = FoodApiService().getRandomMeal();
  }

  late Meal meal;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 26, 25, 25),
        ),
        child: FutureBuilder(
            future: futuremeal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                meal = snapshot.data!;
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 100),
                  child: Container(
                    color: Colors.black.withOpacity(.5),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (1 - 0.48),
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                meal.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Colors.black.withOpacity(.5),
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
                                  ],
                                ),
                              ),
                            ),
                            BottomInfoSheet(
                              minSize: .50,
                              backdrops: meal.img,
                              child: [
                                Center(
                                  child: Text(
                                    meal.title,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                                Padding(
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
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
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
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "  Ingredients:",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: meal.ingredients.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          "      - ${meal.ingredients[index]} : ${meal.measures[index]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.menu_book,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "   Instructions:",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      meal.instructions,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.video_library,
                                        color: Colors.white,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          print(launch(meal.ytLink));
                                        },
                                        child: const Text(
                                          "Check the Youtube video of the recipe!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
