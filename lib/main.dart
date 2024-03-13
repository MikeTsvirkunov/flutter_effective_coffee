import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/app.dart';
import 'package:flutter_course/src/common/containers/conteiner_extender.dart';
import 'package:flutter_course/src/common/values/global_variables_container.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';

void main() {
  // var x = ListOfGoodsModel();
  // x.update(null);
  // ContainerExtender.extend(
  //   globalVariablesContainer,
  //   'Global.ListOfGoodsModel',
  //   x,
  // );
  runZonedGuarded(() => runApp(const CoffeeShopApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}
