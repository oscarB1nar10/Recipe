import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/domain/model/FoodCategory.dart';
import 'package:recipe/domain/model/Recipe.dart';
import 'package:recipe/domain/states/Result.dart';
import 'package:recipe/framework/presentation/RecipeBloc.dart';
import 'package:recipe/framework/presentation/RecipeSelector.dart';

import 'ErrorHandleWidget.dart';
import 'LoadingWidget.dart';
import 'RecipeListWidget.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreen createState() => _RecipeListScreen();
}

class _RecipeListScreen extends State<RecipeListScreen> {
  RecipeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = RecipeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Recipe List'),
          backgroundColor: Color.fromARGB(164, 172, 171, 171)),
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 56, minWidth: double.infinity, maxHeight: 64),
            child: RecipeSelector(onRecipeSelected),
          ),
          Expanded(
            child: StreamBuilder<Result<List<Recipe>>>(
              stream: _bloc.recipeListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return Loading();
                      break;
                    case Status.COMPLETED:
                      return RecipeList(recipeList: snapshot.data.data);
                      break;
                    case Status.ERROR:
                      return ErrorHandleWidget(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.searchRecipes(),
                      );
                      break;
                  }
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  void onRecipeSelected(FoodCategory foodCategory) {
    _bloc.query = '${foodCategory.toString().split('.').last}';
    _bloc.searchRecipes();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
