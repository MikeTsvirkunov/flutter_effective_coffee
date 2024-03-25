import 'package:flutter_course/src/common/interfaces/interface_action.dart';
import 'package:flutter_course/src/common/interfaces/interface_extractable.dart';

class DynamicAction implements ActionInterface {
  late final Function function;
  DynamicAction({required function});
  @override
  void action(IExtractable? args) {
    function(args);
  }
}
