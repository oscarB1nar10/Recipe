enum FoodCategory {
  chicken,
  beef,
  soup,
  dessert,
  vegetarian,
  milk,
  vegan,
  pizza,
  donut
}

List<FoodCategory> getFoodCategories() {
  List<FoodCategory> foodCategoryList = [];

  foodCategoryList.add(FoodCategory.chicken);
  foodCategoryList.add(FoodCategory.beef);
  foodCategoryList.add(FoodCategory.soup);
  foodCategoryList.add(FoodCategory.dessert);
  foodCategoryList.add(FoodCategory.vegetarian);
  foodCategoryList.add(FoodCategory.milk);
  foodCategoryList.add(FoodCategory.vegan);
  foodCategoryList.add(FoodCategory.pizza);
  foodCategoryList.add(FoodCategory.donut);

  return foodCategoryList;
}
