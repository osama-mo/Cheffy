import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;

  const Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var jsonmeal = json['meals'][0];

    return Category(
      id: jsonmeal['idIngredient'],
      title: jsonmeal['strIngredient'],
    );
  }
}
