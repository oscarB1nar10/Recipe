import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/domain/model/Recipe.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipeList;

  const RecipeList({Key key, this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: recipeList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                recipeList[index].featuredImage,
                width: 200,
                height: 200,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        );
      },
    );
  }
}
