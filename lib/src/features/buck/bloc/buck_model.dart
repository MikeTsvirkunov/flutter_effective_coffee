import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';

class BuckModel extends ChangeNotifier {
  Map<GoodModel, int> goodsInBuck;

  BuckModel({required this.goodsInBuck});

  void updateBucket(GoodModel gm, int count) {
    if (count != 0)
      goodsInBuck[gm] = count;
    else
      goodsInBuck.remove(gm);
    notifyListeners();
  }

  void clearBucket() {
    goodsInBuck = {};
    notifyListeners();
  }
}
