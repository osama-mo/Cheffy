import 'package:cheffy/food_api_service.dart';
import 'package:cheffy/provider/food_api_functions.dart';
import 'package:cheffy/screens/CategoryScreen/widgets/category_item.dart';
import 'package:cheffy/screens/CategoryScreen/widgets/category_list_item.dart';
import 'package:cheffy/screens/SearchScreen/widgets/search_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/background.dart';
import '../MealDetailsScreen/widgets/meal_class.dart';

class CategoriesList extends StatefulWidget {
  final String title;

  const CategoriesList({super.key, required this.title});
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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
        future: FoodApiService().getCategories(widget.title),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == 0
                ? const Center(
                    child: Text(
                      "No Results!",
                      style: TextStyle(fontSize: 32.0),
                    ),
                  )
                : SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: PageScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(snapshot.data[index].id);
                        return CategoryListItem(
                          title: snapshot.data[index].title,
                          type: widget.title,
                        );
                      },
                    ),
                  );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
