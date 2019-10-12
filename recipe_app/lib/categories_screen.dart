import 'package:flutter/material.dart';
import 'package:recipe_app/category_item.dart';
import 'package:recipe_app/models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(
              id: catData.id,
              title: catData.title,
              color: catData.color,
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
