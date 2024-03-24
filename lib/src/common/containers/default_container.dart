import 'package:flutter_course/src/common/interfaces/interface_extendable.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

class DefaultContainer implements IExtendable, IExtractable {
  late Map<dynamic, dynamic> _container = {};

  DefaultContainer(Map<dynamic, dynamic> container) {
    _container = container;
  }

  @override
  void extend(Object key, Object value) {
    _container[key] = value;
  }

  @override
  T extract<T>(Object key) {
    return _container[key] as T;
  }
}
