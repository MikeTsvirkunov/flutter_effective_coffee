import 'package:flutter_course/src/common/interfaces/interface_extendable.dart';

/// Class values for extend container
class ContainerExtender {
  /// set object [value] to extendable [container] on [key]
  static void extend(IExtendable container, Object key, Object value) {
    container.extend(key, value);
  }
}
