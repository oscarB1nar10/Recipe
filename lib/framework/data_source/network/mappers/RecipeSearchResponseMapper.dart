import 'package:recipe/domain/model/Recipe.dart';
import 'package:recipe/domain/util/EntityMapper.dart';
import 'package:recipe/framework/data_source/network/model/RecipeDto.dart';

class RecipeSearchResponseMapper implements EntityMapper<RecipeDto, Recipe> {
  @override
  Recipe mapFromEntity(RecipeDto entity) {
    var recipeModel = Recipe();
    recipeModel.pk = entity.pk;
    recipeModel.title = entity.title;
    recipeModel.publisher = entity.publisher;
    recipeModel.featuredImage = entity.featuredImage;
    recipeModel.rating = entity.rating;
    recipeModel.sourceUrl = entity.sourceUrl;
    recipeModel.description = entity.description;
    recipeModel.cookingInstructions = entity.cookingInstructions;
    recipeModel.ingredients = entity.ingredients;
    recipeModel.dateAdded = entity.dateAdded;
    recipeModel.dateUpdated = entity.dateUpdated;

    return recipeModel;
  }

  @override
  RecipeDto mapToEntity(Recipe domainModel) {
    var recipeDto = RecipeDto(
        domainModel.pk,
        domainModel.title,
        domainModel.publisher,
        domainModel.featuredImage,
        domainModel.rating,
        domainModel.sourceUrl,
        domainModel.description,
        domainModel.cookingInstructions,
        domainModel.ingredients,
        domainModel.dateAdded,
        domainModel.dateUpdated);

    return recipeDto;
  }

  List<Recipe> mapListOfEntityToMapOfDomainModel(
      List<RecipeDto> recipeDtoList) {
    List<Recipe> recipeList = [];
    recipeDtoList.forEach((recipeDto) {
      recipeList.add(mapFromEntity(recipeDto));
    });

    return recipeList;
  }
}
