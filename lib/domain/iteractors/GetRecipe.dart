import 'package:recipe/di/service_locator.dart';
import 'package:recipe/domain/data/network/implementation/RecipeNetworkDataSourceImpl.dart';

class GetRecipe {
  RecipeNetworkDataSourceImpl recipeNetworkDataSourceImpl =
      sl.get<RecipeNetworkDataSourceImpl>();

  Future<dynamic> get(int id) async {
    return recipeNetworkDataSourceImpl.get(id);
  }
}
