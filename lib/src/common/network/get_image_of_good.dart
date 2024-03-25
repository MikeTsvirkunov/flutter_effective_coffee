import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_course/src/common/interfaces/interface_async_strategy.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

class GetImageOfGoodStrategy implements AsyncStrategyInterface {
  @override
  Future<T> execute<T>(IExtractable? args) async {
    // ContainerExtractor.extract<String>(args!, 'good_id');
    var image1 =
        (await rootBundle.load('assets/images/empty.png')).buffer.asUint8List();
    var image2 =
        (await rootBundle.load('assets/images/coffe.png')).buffer.asUint8List();
    var random = Random();
    int randomNumber = random.nextInt(100);
    return (randomNumber > 50 ? image1 : image2) as T;
  }
}
