import 'package:cheffy/food_api_service.dart';
import 'package:cheffy/provider/food_api_functions.dart';
import 'package:cheffy/screens/SearchScreen/widgets/search_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/background.dart';
import '../MealDetailsScreen/widgets/meal_class.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  late Future<List<Meal>> futuremeals;
  String _searchTerm = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        ),
      ),
      body: FutureBuilder(
        future: FoodApiService().getSearchResults(_searchTerm),
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
