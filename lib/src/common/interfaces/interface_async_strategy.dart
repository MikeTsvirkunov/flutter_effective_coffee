import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

abstract class AsyncStrategyInterface {
  Future<T> execute<T>(IExtractable? args) async {
    throw UnimplementedError();
  }
}
