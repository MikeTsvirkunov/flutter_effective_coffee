import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/network/get_all_goods_strategy.dart';
import 'package:flutter_course/src/features/menu/bloc/list_of_goods_model.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:flutter_course/src/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_course/src/features/menu/view/widgets/list_of_goods.dart';

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
  late ListOfGoodsModel x;
  @override
  void initState() {
    x = ListOfGoodsModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ScrollTabChecker(
    //           categories: glf.keys,
    //         )
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SizedBox(
          height: 40,
        ),
      ),
      body: const ListOfGoods(),
    );
    // );
  }
}
