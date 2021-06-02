import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/domain/model/Recipe.dart';

class RecipeDetailWidget extends StatelessWidget {
  Recipe recipe;

  RecipeDetailWidget(Recipe recipe) {
    this.recipe = recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Detail"),
        backgroundColor: Color.fromARGB(164, 172, 171, 171),
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(child: recipeDetail()),
    );
  }

  Widget recipeDetail() {
    return Container(
      width: double.infinity,
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Image.network(
                recipe.featuredImage,
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  recipe.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white70),
                ),
                Text(
                  recipe.rating.toString(),
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 24)),
            Text(
              getRecipeIngredients(),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  String getRecipeIngredients() {
    String ingredients = "";
    for (String ingredient in recipe.ingredients) {
      ingredients += '$ingredient \n';
    }
    return ingredients;
  }
}
