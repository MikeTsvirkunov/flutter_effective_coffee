import 'dart:convert';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:flutter_course/src/features/buck/bloc/buck_model.dart';
import 'package:http/http.dart' as http;

class PostOrderStrategy implements AsyncStrategyInterface {
  @override
  Future<T> execute<T>(IExtractable? args) async {
    var url = Uri.parse(
      'https://coffeeshop.academy.effective.band/api/v1/orders',
    );
    var data = ContainerExtractor.extract<BuckModel>(args!, 'buck');
    Map<String, dynamic> body = {
      "positions": <String, int>{},
      'token': "<FCM Registration Token>",
    };
    for (var i in data.goodsInBuck.entries) {
      body['positions'][i.key.id.toString()] = i.value;
    }
    String d = json.encode(body);
    final response = await http.post(
      url,
      body: d,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response as T;
  }
}
