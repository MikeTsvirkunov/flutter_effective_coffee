import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_updateable.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';

class ListOfGoodsModel extends Cubit<List<Object>>
    implements UpdateableInterface {
  /// {@macro counter_cubit}
  ListOfGoodsModel() : super([]);

  @override
  Future<List<GoodModel>> update(IExtractable? args) async {
    var respones = await ContainerExtractor.extract<AsyncStrategyInterface>(
      functionsContainer,
      'Api.Get.ListOfGoods',
    ).execute<Map<dynamic, dynamic>>(null);
    var listOfGoods = ContainerExtractor.extract<StrategyInterface>(
      functionsContainer,
      'Extractors.GoodsList.From.JsonRespone',
    ).execute<List<dynamic>>(
      ConstantContainer({'json_map': respones}),
    );
    List<GoodModel> listOfGoodsProcessed = [];

    for (var jsonGood in listOfGoods) {
      var image = await ContainerExtractor.extract<AsyncStrategyInterface>(
        functionsContainer,
        'Api.Get.ImageOfGood',
      ).execute<Uint8List>(
        ConstantContainer({'good_id': jsonGood['id']}),
      );
      jsonGood['image'] = image;
      var goodProcessed = ContainerExtractor.extract<StrategyInterface>(
        functionsContainer,
        'Builders.Good.FromJsonMapGood',
      ).execute<GoodModel>(ConstantContainer({'json_map_good': jsonGood}));
      listOfGoodsProcessed.add(goodProcessed);
    }

    emit(listOfGoodsProcessed);
    return listOfGoodsProcessed;
  }
}
