import 'package:recipe/domain/data/network/implementation/RecipeNetworkDataSourceImpl.dart';
import 'package:recipe/domain/model/Recipe.dart';
import 'package:recipe/framework/data_source/network/mappers/RecipeSearchResponseMapper.dart';
import 'package:recipe/framework/data_source/network/model/RecipeSearchResponse.dart';

class SearchRecipes {
  RecipeNetworkDataSourceImpl recipeNetworkDataSourceImpl =
      RecipeNetworkDataSourceImpl();

  Future<List<Recipe>> search(int page, String query) async {
    final response = await recipeNetworkDataSourceImpl.search(page, query);

    final recipeDtoList = RecipeSearchResponse.fromJson(response).recipes;

    return RecipeSearchResponseMapper()
        .mapListOfEntityToListOfDomainModel(recipeDtoList);
  }
}
