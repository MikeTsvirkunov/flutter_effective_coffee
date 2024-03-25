import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/conteiner_extender.dart';
import 'package:flutter_course/src/common/getters/get_list_of_goods_strategy.dart';
import 'package:flutter_course/src/common/values/global_variables_container.dart';
import 'package:flutter_course/src/features/buck/view/bucket_panel.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/list_of_goods.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpBucket extends StatefulWidget {
  const SlidingUpBucket({super.key});

  @override
  State<SlidingUpBucket> createState() => _SlidingUpBucketState();
}

class _SlidingUpBucketState extends State<SlidingUpBucket> {
  final controller = PanelController();
  @override
  void initState() {
    ContainerExtender.extend(
      globalVariablesContainer,
      'SlidingUpPanel.Controller',
      controller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: controller,
      header: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xFF191C1B),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
      color: Theme.of(context).colorScheme.onBackground,
      border: Border.symmetric(
        vertical: BorderSide(color: Theme.of(context).colorScheme.onBackground),
      ),
      // boxShadow: const [BoxShadow(color: Colors.white)],
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      minHeight: 30,
      collapsed: Container(
        height: 30,
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xFF191C1B),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      panel: const Padding(
        padding: EdgeInsets.only(top: 30),
        child: BucketPanel(),
      ),
      body: FutureProvider<ListOfGoodsModel>(
        initialData: ListOfGoodsModel(),
        create: (context) => GetListOfGoodsStrategy().execute(null),
        child: const ListOfGoods(),
      ),
    );
  }
}
