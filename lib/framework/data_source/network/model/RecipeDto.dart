import 'dart:core';
import 'package:auto_data/auto_data.dart';

class RecipeDto {
  int pk = 0;
  @nullable
  String title = "";
  @nullable
  String publisher = "";
  @nullable
  String featuredImage = "";
  @nullable
  int rating = 0;
  @nullable
  String sourceUrl = "";
  @nullable
  String description = "";
  @nullable
  String cookingInstructions = "";
  @nullable
  List<String> ingredients = [];
  @nullable
  String dateAdded = "";
  @nullable
  String dateUpdated = "";

  RecipeDto(
      this.pk,
      this.title,
      this.publisher,
      this.featuredImage,
      this.rating,
      this.sourceUrl,
      this.description,
      this.cookingInstructions,
      this.ingredients,
      this.dateAdded,
      this.dateUpdated);

  RecipeDto.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['title'];
    publisher = json['publisher'];
    featuredImage = json['featured_image'];
    rating = json['rating'];
    sourceUrl = json['source_url'];
    description = json['description'];
    cookingInstructions = json['cooking_instructions'];
    ingredients = getRecipeIngredients(json['ingredients']);
    dateAdded = json['date_added'];
    dateUpdated = json['date_updated'];
  }

  List<String> getRecipeIngredients(List<dynamic> dynamicIngredients) {
    List<String> ingredients = [];
    for (String ingredient in dynamicIngredients) {
      ingredients.add(ingredient);
    }
    return ingredients;
  }
}
