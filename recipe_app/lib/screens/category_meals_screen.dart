import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  Color categoryColor;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryColor = routeArgs['color'] as Color;

      displayedMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: displayedMeals[index],
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryColor.withOpacity(0.7),
              categoryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
