import 'package:auto_data/auto_data.dart';
import 'package:recipe/framework/data_source/network/model/RecipeDto.dart';

@data
class RecipeSearchResponse {
  int count = 0;
  List<RecipeDto> recipes;

  RecipeSearchResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      recipes = [];
      json['results'].forEach((recipe) {
        recipes.add(new RecipeDto.fromJson(recipe));
      });
    }
  }
}
