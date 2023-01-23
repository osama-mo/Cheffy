// ignore_for_file: prefer_const_constructors

import 'package:cheffy/screens/HomeScreen/widgets/meals_row_item.dart';
import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';

import '../../MealDetailsScreen/widgets/meal_class.dart';

class MealsRowList extends StatefulWidget {
  final Future<List<Meal>> Function(String) futuremealsfunction;
  final String header;
  final String param;
  const MealsRowList(
      {super.key,
      required this.futuremealsfunction,
      required this.header,
      required this.param});

  @override
  State<MealsRowList> createState() => _MealsRowListState();
}

class _MealsRowListState extends State<MealsRowList> {
  late Future<List<Meal>> futuremeals;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuremeals = widget.futuremealsfunction(widget.param);
  }

  late List<Meal> meals;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futuremeals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            meals = snapshot.data!;
            return SizedBox(
              height: 200.0,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: meals.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MealsRowItem(meal: meals[index]);
                  }),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
