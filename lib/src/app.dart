import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/network/get_all_goods_strategy.dart';
import 'package:flutter_course/src/features/buck/bloc/buck_model.dart';
import 'package:flutter_course/src/features/buck/view/bucket_panel.dart';
import 'package:flutter_course/src/features/buck/view/slideing_up_bucket.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';
import 'package:flutter_course/src/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Map<dynamic, dynamic>>? x =
        GetAllGoodsStrategy().execute<Map<dynamic, dynamic>>(null);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      theme: theme,
      home: const Center(child: MyWidget()),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late ListOfGoodsModel x = ListOfGoodsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SizedBox(
          height: 40,
        ),
      ),
      body: ChangeNotifierProvider<BuckModel>(
        create: (BuildContext context) => BuckModel(goodsInBuck: {}),
        child: const SlidingUpBucket(),
      ),
    );
  }
}
