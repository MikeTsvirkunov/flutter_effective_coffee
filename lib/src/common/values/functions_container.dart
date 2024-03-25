import 'package:flutter_course/src/common/builders/category_tag_builder.dart';
import 'package:flutter_course/src/common/builders/good_card_from_good_model_build_strategy.dart';
import 'package:flutter_course/src/common/builders/good_from_json_map_good_builder_strategy.dart';
import 'package:flutter_course/src/common/builders/grid_list_of_goods_build_strategy.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/functions/categories_to_list_strategy.dart';
import 'package:flutter_course/src/common/functions/goods_list_from_json_extract_strategy.dart';
import 'package:flutter_course/src/common/network/get_all_goods_strategy.dart';
import 'package:flutter_course/src/common/network/get_image_of_good.dart';
import 'package:flutter_course/src/common/procedures/scroll_to_subcategory_action.dart';
import 'package:flutter_course/src/common/processors/waiter_processor_strategy.dart';

var functionsContainer = ConstantContainer({
  'Api.Get.ListOfGoods': GetAllGoodsStrategy(),
  'Api.Get.ImageOfGood': GetImageOfGoodStrategy(),
  'Builders.Good.FromJsonMapGood': GoodFromJsonMapGoodBuilderStrategy(),
  'Extractors.GoodsList.From.JsonRespone': GoodsListFromJsonExtractStrategy(),
  'Waiter.Processors.Std': WaiterProcessorStrategy(),
  'GridList.Builders.FromListOfGoodsList': GridListOfGoodsBuildStrategy(),
  'GoodCard.Builders.FromGoodModel': GoodCardFromGoodModelStrategy(),
  'CategoryTag.Builder': CategoryTagBuilderStrategy(),
  'ScrollTabContainer.Processors.CategoriesToList': CategoriesToListStrategy(),
  'ScrollTabContainer.ScrollToSubcategoryAction': ScrollToSubcategoryAction()
  // 'DynamicAction':
});
