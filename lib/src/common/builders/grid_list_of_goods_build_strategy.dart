import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/containers/conteiner_extender.dart';
import 'package:flutter_course/src/common/containers/default_container.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/common/values/global_variables_container.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/category_header.dart';
import 'package:flutter_course/src/features/menu/view/widgets/scroll_tab_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GridListOfGoodsBuildStrategy implements StrategyInterface {
  @override
  T execute<T>(IExtractable? args) {
    ItemScrollController itemScrollController = ItemScrollController();
    ScrollOffsetController scrollOffsetController = ScrollOffsetController();
    ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();
    ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
    var goodsList = ContainerExtractor.extract<List<GoodModel>>(args!, 'data');
    Map<String, List<GoodModel>> glf = {};
    for (var i in goodsList) {
      if (!glf.containsKey(i.subtype)) {
        glf[i.subtype] = [i];
      } else {
        glf[i.subtype]!.add(i);
      }
    }
    ContainerExtender.extend(
      globalVariablesContainer,
      'ListOfGoods.MappedBySubtype',
      glf,
    );
    ContainerExtender.extend(
      globalVariablesContainer,
      'GridListOfGoods.ItemScrollController',
      itemScrollController,
    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ScrollTabChecker(
              categories: glf.keys,
            )),
        body: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          scrollOffsetController: scrollOffsetController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetListener: scrollOffsetListener,
          itemCount: glf.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryHeader(
                header: glf.keys.elementAt(index),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: glf.values.elementAt(index).length,
                itemBuilder: (context, index2) =>
                    ContainerExtractor.extract<StrategyInterface>(
                  functionsContainer,
                  'GoodCard.Builders.FromGoodModel',
                ).execute<Widget>(
                  DefaultContainer(
                    {'good_model': glf.values.elementAt(index)[index2]},
                  ),
                ),
              ),
            ],
          ),
        )) as T;
  }
}
