import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/good_card.dart';

class GoodCardFromGoodModelStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var goodModel = ContainerExtractor.extract<GoodModel>(args!, 'good_model');
    return GoodCard(
      name: goodModel.name,
      imageUrl: goodModel.imageUrl,
      id: goodModel.id,
      price: goodModel.priece.toString(),
    ) as T;
  }
}
