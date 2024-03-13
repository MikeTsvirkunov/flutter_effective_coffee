import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

/// extractable container without opportumity to extend its.
class ConstantContainer implements IExtractable {
  late Map<dynamic, dynamic> _container;

  ConstantContainer(Map<dynamic, dynamic> container) {
    _container = container;
  }

  /// extract object with type [T] by [key] value
  @override
  T extract<T>(Object key) {
    return (_container.keys.contains(key) ? _container[key] : null) as T;
  }
}
