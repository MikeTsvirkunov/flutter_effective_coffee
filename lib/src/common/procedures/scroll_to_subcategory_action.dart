import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_action.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/values/global_variables_container.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollToSubcategoryAction implements ActionInterface {
  @override
  void action(IExtractable? args) {
    var isc = ContainerExtractor.extract<ItemScrollController>(
      globalVariablesContainer,
      'GridListOfGoods.ItemScrollController',
    );
    var glf = ContainerExtractor.extract<Map<String, List<Object>>>(
      globalVariablesContainer,
      'ListOfGoods.MappedBySubtype',
    );
    var category = ContainerExtractor.extract<String>(args!, 'category');
    var k = 0;
    for (var i in glf.keys) {
      if (i == category) {
        break;
      }
      k += 1;
    }
    isc.scrollTo(
      index: k,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutCubic,
    );
  }
}
