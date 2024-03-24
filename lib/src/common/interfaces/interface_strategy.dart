import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

abstract class StrategyInterface {
  T execute<T>(IExtractable? args);
}
