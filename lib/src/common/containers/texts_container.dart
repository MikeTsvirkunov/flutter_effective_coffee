import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

class TextContainer implements IExtractable {
  late Map<dynamic, dynamic> _container;

  TextContainer(Map<dynamic, dynamic> container) {
    _container = container;
  }

  @override
  T extract<T>(Object key) {
    // context.getResources().getConfiguration().locale;
    return _container[key] as T;
  }
}
