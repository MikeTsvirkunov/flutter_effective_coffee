import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';

class GetListOfGoodsStrategy implements AsyncStrategyInterface {
  @override
  Future<T> execute<T>(IExtractable? args) async {
    // Получаем список товаров
    var respones = await ContainerExtractor.extract<AsyncStrategyInterface>(
      functionsContainer,
      'Api.Get.ListOfGoods',
    ).execute<Map<dynamic, dynamic>>(null);
    // Создаём список товаров из ответа
    var listOfGoods = ContainerExtractor.extract<StrategyInterface>(
      functionsContainer,
      'Extractors.GoodsList.From.JsonRespone',
    ).execute<List<dynamic>>(
      ConstantContainer({'json_map': respones}),
    );

    List<GoodModel> listOfGoodsProcessed = [];
    List<String> listOfCategories = [];
    Map<String, List<GoodModel>> pairsOfCategoriesAndGoodModels = {};

    for (var jsonGood in listOfGoods) {
      var goodProcessed = ContainerExtractor.extract<StrategyInterface>(
        functionsContainer,
        'Builders.Good.FromJsonMapGood',
      ).execute<GoodModel>(ConstantContainer({'json_map_good': jsonGood}));
      listOfGoodsProcessed.add(goodProcessed);
      listOfCategories.add(goodProcessed.subtype);
      if (pairsOfCategoriesAndGoodModels.containsKey(goodProcessed.subtype)) {
        pairsOfCategoriesAndGoodModels[goodProcessed.subtype]!
            .add(goodProcessed);
      } else {
        pairsOfCategoriesAndGoodModels[goodProcessed.subtype] = [];
      }
    }

    var r = ListOfGoodsModel(
      listOfCategories: listOfCategories,
      listOfGoods: listOfGoodsProcessed,
      pairsOfCategoriesAndGoodModels: pairsOfCategoriesAndGoodModels,
    );
    return r as T;
  }
}
