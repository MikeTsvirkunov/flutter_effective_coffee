import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';

class GoodsListFromJsonExtractStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var jsonMap = ContainerExtractor.extract<Map<dynamic, dynamic>>(
      args!,
      'json_map',
    );
    var p = jsonMap.containsKey('list_of_goods');
    var e = jsonMap['list_of_goods'];
    return e as T;
  }
}
