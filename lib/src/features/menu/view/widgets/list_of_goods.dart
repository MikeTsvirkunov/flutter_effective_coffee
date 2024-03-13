import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/common/widgets/waiter.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';

class ListOfGoods extends StatefulWidget {
  const ListOfGoods({super.key});

  @override
  State<ListOfGoods> createState() => _ListOfGoodsState();
}

class _ListOfGoodsState extends State<ListOfGoods> {
  late ListOfGoodsModel x;
  @override
  void initState() {
    super.initState();
    x = ListOfGoodsModel();
  }

  @override
  Widget build(BuildContext context) {
    return Waiter(
      childBuilder: ContainerExtractor.extract(
        functionsContainer,
        'GridList.Builders.FromListOfGoodsList',
      ),
      future: x.update(null),
      strategySnapshotProcessor: ContainerExtractor.extract(
        functionsContainer,
        'Waiter.Processors.Std',
      ),
    );
  }
}
