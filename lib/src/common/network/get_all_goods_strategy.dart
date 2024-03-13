import 'dart:convert';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter/services.dart' show rootBundle;

class GetAllGoodsStrategy extends AsyncStrategyInterface {
  @override
  Future<T> execute<T>(IExtractable? args) async {
    var r = await rootBundle
        .loadString('assets/test_data/list_of_goods.json')
        .then((jsonStr) => jsonDecode(jsonStr) as Map<dynamic, dynamic>);
    return await Future<Map<dynamic, dynamic>>.delayed(
      const Duration(seconds: 2),
      () => r,
    ) as T;
  }
}
