import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({@required this.meal, @required this.removeItem})
      : id = meal.id,
        title = meal.title,
        imageUrl = meal.imageUrl,
        duration = meal.duration,
        affordability = meal.affordability,
        complexity = meal.complexity;

//  String get _complexityText {
//    switch (complexity) {
//      case Complexity.Simple:
//        return 'Simple';
//        break;
//      case Complexity.Challenging:
//        return 'Challenging';
//        break;
//      case Complexity.Hard:
//        return 'Hard';
//        break;
//      default:
//        return 'Unknown';
//        break;
//    }
//  }
//
//  String get _affordabilityText {
//    switch (affordability) {
//      case Affordability.Affordable:
//        return 'Affordable';
//        break;
//      case Affordability.Pricey:
//        return 'Pricey';
//        break;
//      case Affordability.Luxurious:
//        return 'Luxurious';
//        break;
//      default:
//        return 'Unknown';
//        break;
//    }
//  }

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((id) {
      if (id != null) {
        removeItem(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54,
                    ),
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
//                      Text(_complexityText),
                        Text(describeEnum(complexity))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
//                      Text(_affordabilityText),
                        Text(describeEnum(affordability))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
