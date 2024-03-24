import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';

class WaiterProcessorStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    var snapshot =
        ContainerExtractor.extract<AsyncSnapshot<dynamic>>(args!, 'snapshot');
    var childBuilder =
        ContainerExtractor.extract<StrategyInterface>(args, 'child_builder');
    if (snapshot.hasData) {
      var x = childBuilder
          .execute<Widget>(ConstantContainer({'data': snapshot.data}));
      return x as T;
    } else if (snapshot.hasError) {
      return ErrorWidget(snapshot.error.toString()) as T;
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      ) as T;
    }
  }
}
