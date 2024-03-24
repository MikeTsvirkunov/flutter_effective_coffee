import 'dart:convert';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';
import 'package:http/http.dart' as http;

class GetAllGoodsStrategy extends AsyncStrategyInterface {
  @override
  Future<T> execute<T>(IExtractable? args) async {
    var url = Uri.parse(
      'https://coffeeshop.academy.effective.band/api/v1/products/?page=0&limit=50',
    );
    final response = await http.get(url).then((jsonStr) {
      return jsonDecode(utf8.decode(jsonStr.bodyBytes))
          as Map<dynamic, dynamic>;
    });
    return response as T;
  }
}
