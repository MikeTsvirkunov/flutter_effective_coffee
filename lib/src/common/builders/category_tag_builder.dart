import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/features/menu/view/widgets/tab_category.dart';

class CategoryTagBuilderStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var text = ContainerExtractor.extract<String>(args!, 'text');
    var func = ContainerExtractor.extract<Function>(args, 'function');
    var count = ContainerExtractor.extract<int>(args, 'count');
    return CategoryTag(text: text, func: func, count: count) as T;
  }
}
