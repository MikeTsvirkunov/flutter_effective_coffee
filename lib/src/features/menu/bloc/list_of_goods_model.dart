import 'package:flutter_course/src/features/menu/bloc/good_model.dart';

class ListOfGoodsModel {
  List<String>? listOfCategories;
  Map<String, List<GoodModel>>? pairsOfCategoriesAndGoodModels;
  List<GoodModel>? listOfGoods;
  ListOfGoodsModel({
    this.listOfCategories,
    this.listOfGoods,
    this.pairsOfCategoriesAndGoodModels,
  });
}
