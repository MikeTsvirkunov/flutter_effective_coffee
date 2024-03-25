import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/containers/conteiner_extender.dart';
import 'package:flutter_course/src/common/containers/default_container.dart';
import 'package:flutter_course/src/common/getters/get_list_of_goods_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/common/values/global_variables_container.dart';
import 'package:flutter_course/src/features/buck/bloc/buck_model.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/category_header.dart';
import 'package:flutter_course/src/features/menu/view/widgets/scroll_tab_checker.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ListOfGoods extends StatefulWidget {
  const ListOfGoods({super.key});

  @override
  State<ListOfGoods> createState() => _ListOfGoodsState();
}

class _ListOfGoodsState extends State<ListOfGoods> {
  ItemScrollController itemScrollController = ItemScrollController();
  ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
  late ListOfGoodsModel x = ListOfGoodsModel();
  @override
  void initState() {
    ContainerExtender.extend(
      globalVariablesContainer,
      'GridListOfGoods.ItemScrollController',
      itemScrollController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ListOfGoodsModel, BuckModel>(
      child: Text('asdfgh'),
      builder: (context, value, bm, child) {
        if (value.pairsOfCategoriesAndGoodModels != null) {
          ContainerExtender.extend(
            globalVariablesContainer,
            'ListOfGoods.MappedBySubtype',
            value.pairsOfCategoriesAndGoodModels!,
          );
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: bm.goodsInBuck.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.checkoutButtonColor,
                      onPressed: () {
                        var x = ContainerExtractor.extract<PanelController>(
                          globalVariablesContainer,
                          'SlidingUpPanel.Controller',
                        );
                        x.animatePanelToPosition(1);
                        // x.open();
                      },
                      icon: SvgPicture.asset('assets/images/buck.svg'),
                      label: Text(
                        bm.goodsInBuck.keys
                            .map((e) => e.priece)
                            .reduce((v, e) => v + e)
                            .toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  )
                : null,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: ScrollTabChecker(
                categories: value.pairsOfCategoriesAndGoodModels,
              ),
            ),
            body: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              scrollOffsetController: scrollOffsetController,
              itemPositionsListener: itemPositionsListener,
              scrollOffsetListener: scrollOffsetListener,
              itemCount: value.pairsOfCategoriesAndGoodModels!.length,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryHeader(
                    header: value.pairsOfCategoriesAndGoodModels!.keys
                        .elementAt(index),
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 4,
                      childAspectRatio: 0.65,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.pairsOfCategoriesAndGoodModels!.values
                        .elementAt(index)
                        .length,
                    itemBuilder: (context, index2) =>
                        ContainerExtractor.extract<StrategyInterface>(
                      functionsContainer,
                      'GoodCard.Builders.FromGoodModel',
                    ).execute<Widget>(
                      DefaultContainer(
                        {
                          'good_model': value
                              .pairsOfCategoriesAndGoodModels!.values
                              .elementAt(index)[index2],
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const CircularProgressIndicator();

        // return Text(value.listOfGoods.toString());
      },
    );
  }
}



// Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: ScrollTabChecker(
//               categories: glf.keys,
//             )),
//         body: ScrollablePositionedList.builder(
//           itemScrollController: itemScrollController,
//           scrollOffsetController: scrollOffsetController,
//           itemPositionsListener: itemPositionsListener,
//           scrollOffsetListener: scrollOffsetListener,
//           itemCount: glf.length,
//           itemBuilder: (context, index) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CategoryHeader(
//                 header: glf.keys.elementAt(index),
//               ),
//               GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2: 4,
//                   childAspectRatio: 0.72,
//                 ),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: glf.values.elementAt(index).length,
//                 itemBuilder: (context, index2) =>
//                     ContainerExtractor.extract<StrategyInterface>(
//                   functionsContainer,
//                   'GoodCard.Builders.FromGoodModel',
//                 ).execute<Widget>(
//                   DefaultContainer(
//                     {'good_model': glf.values.elementAt(index)[index2]},
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ))
