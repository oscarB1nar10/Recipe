import 'dart:async';

import 'package:recipe/domain/iteractors/SearchRecipes.dart';
import 'package:recipe/domain/model/Recipe.dart';
import 'package:recipe/domain/states/Result.dart';

class RecipeBloc {
  //Interactors
  SearchRecipes _searchRecipes;

  var page = 1;
  var query = "Chicken";

  StreamController _recipeListController;

  StreamSink<Result<List<Recipe>>> get movieListSink =>
      _recipeListController.sink;

  Stream<Result<List<Recipe>>> get recipeListStream =>
      _recipeListController.stream;

  RecipeBloc() {
    _recipeListController = StreamController<Result<List<Recipe>>>();
    _searchRecipes = SearchRecipes();// Class instance
    searchRecipes();// function call
  }

  searchRecipes() async {
    movieListSink.add(Result.loading());

    try {
      List<Recipe> recipes = await _searchRecipes.search(page, query);
      movieListSink.add(Result.completed(recipes));
    } catch (e) {
      movieListSink.add(Result.error(e.toString()));
    }
  }

  dispose() {
    _recipeListController?.close();
  }
}
