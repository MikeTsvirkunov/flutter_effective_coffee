import 'dart:typed_data';
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
      priece: jsonMapGood['price'] as double,
      subtype: jsonMapGood['subtype'] as String,
      image: jsonMapGood['image'] as Uint8List,
    );
    return good as T;
  }
}
