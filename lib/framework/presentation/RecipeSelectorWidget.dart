import 'package:flutter/material.dart';
import 'package:recipe/domain/model/FoodCategory.dart';

class RecipeSelectorWidget extends StatelessWidget {
  final List<FoodCategory> foodCategoryList = getFoodCategories();
  Function(FoodCategory) onCustomButtonPressed;

  RecipeSelectorWidget(Function(FoodCategory) onCustomButtonPressed) {
    this.onCustomButtonPressed = onCustomButtonPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getViewList(),
      scrollDirection: Axis.horizontal,
    );
  }

  List<Widget> getViewList() {
    List<Widget> foodCategoryButtonList = [];

    for (FoodCategory foodCategory in foodCategoryList) {
      foodCategoryButtonList.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                primary: Color.fromARGB(171, 73, 200, 231),
                shadowColor: Colors.blue,
                elevation: 15.0),
            onPressed: () {
              onCustomButtonPressed(foodCategory);
            },
            child: Text('${foodCategory.toString().split('.').last}'),
          ),
        )
      );
    }

    return foodCategoryButtonList;
  }
}
