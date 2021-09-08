import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:recipe/domain/data/network/implementation/RecipeNetworkDataSourceImpl.dart';
import 'package:recipe/domain/iteractors/SearchRecipes.dart';
import 'package:recipe/framework/data_source/network/implementation/RecipeServicesImplementation.dart';
import 'package:recipe/framework/presentation/RecipeBloc.dart';

// Ambient variable to access the service locator
final sl = GetIt.instance;

void setup() {
  sl.registerSingleton<Client>(Client());

  // As creating the instance on registration can be time consuming at app start-up
  // you can shift the creation to the time the object is the first time requested
  sl.registerLazySingleton<RecipeServiceImpl>(() => RecipeServiceImpl());

  sl.registerLazySingleton<RecipeNetworkDataSourceImpl>(
      () => RecipeNetworkDataSourceImpl());

  sl.registerLazySingleton<SearchRecipes>(() => SearchRecipes());
  sl.registerSingleton<RecipeBloc>(RecipeBloc());
}
