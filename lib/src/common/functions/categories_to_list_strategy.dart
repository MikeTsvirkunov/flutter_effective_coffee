import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';

class CategoriesToListStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var categories =
        ContainerExtractor.extract<Iterable<String>>(args!, 'categories');
    // var l = List.generate(, (index) => null)
    // categories.toList();
    return categories.toList() as T;
  }
}
