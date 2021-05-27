import 'package:recipe/domain/data/network/abstraction/RecipeNetworkDataSource.dart';
import 'package:recipe/framework/data_source/network/implementation/RecipeServicesImplementation.dart';

class RecipeNetworkDataSourceImpl implements RecipeNetworkDataSource {
  RecipeServiceImpl recipeServiceImpl = new RecipeServiceImpl();

  @override
  Future<dynamic> get(int id) async {
    return recipeServiceImpl.get(id);
  }

  @override
  Future<dynamic> search(int page, String query) async {
    return await recipeServiceImpl.search(page, query);
  }
}
