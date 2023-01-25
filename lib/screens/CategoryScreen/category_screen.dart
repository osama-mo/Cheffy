import 'package:cheffy/screens/CategoryScreen/widgets/category_item.dart';
import 'package:cheffy/screens/SearchScreen/widgets/search_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/background.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        CategoryItem(
            title: "Category",
            imgUrl: "https://cdn-icons-png.flaticon.com/512/1046/1046874.png"),
        CategoryItem(
            title: "Area",
            imgUrl:
                "https://www.iconpacks.net/icons/2/free-location-icon-2952-thumb.png"),
        CategoryItem(
            title: "Ingredients",
            imgUrl: "https://cdn-icons-png.flaticon.com/512/103/103168.png")
      ],
    ));
  }
}
