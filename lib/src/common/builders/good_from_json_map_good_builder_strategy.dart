import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';

class GoodFromJsonMapGoodBuilderStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var jsonMapGood = ContainerExtractor.extract<Map<String, dynamic>>(
      args!,
      'json_map_good',
    );
    var good = GoodModel(
      id: jsonMapGood['id'].toString(),
      name: jsonMapGood['name'] as String,
      priece: double.parse(jsonMapGood['prices'][0]['value'].toString()),
      currency: jsonMapGood['prices'][0]['currency'] as String,
      subtype: jsonMapGood['category']['slug'] as String,
      imageUrl: jsonMapGood['imageUrl'] as String,
    );
    return good as T;
  }
}
