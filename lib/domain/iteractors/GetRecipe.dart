import 'package:recipe/domain/data/network/implementation/RecipeNetworkDataSourceImpl.dart';

class GetRecipe {
  RecipeNetworkDataSourceImpl recipeNetworkDataSourceImpl =
      RecipeNetworkDataSourceImpl();

  Future<dynamic> get(int id) async {
    return recipeNetworkDataSourceImpl.get(id);
  }
}
