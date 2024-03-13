import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

abstract class UpdateableInterface {
  void update(IExtractable? args) async {
    throw UnimplementedError();
  }
}
