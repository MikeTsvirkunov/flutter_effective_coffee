import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';

class ScrollTabChecker extends StatefulWidget {
  final dynamic categories;

  const ScrollTabChecker({super.key, this.categories});

  @override
  State<ScrollTabChecker> createState() => _ScrollTabChackerState();
}

class _ScrollTabChackerState extends State<ScrollTabChecker> {
  late List<String> x = ContainerExtractor.extract<StrategyInterface>(
    functionsContainer,
    'ScrollTabContainer.Processors.CategoriesToList',
  ).execute<List<String>>(
    ConstantContainer({'categories': widget.categories}),
  );
  late Map<String, int> p = {for (var element in x) element: 0};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            spacing: 10,
            children: List.generate(
              x.length,
              (index) => ContainerExtractor.extract<StrategyInterface>(
                functionsContainer,
                'CategoryTag.Builder',
              ).execute(
                ConstantContainer(
                  {
                    'text': x[index],
                    'count': p[x[index]],
                    'function': (bool s) {
                      var m = p.values.toList().reduce(max);
                      // m += 1;
                      p[x[index]] = s ? m + 1 : 0;
                      setState(() {
                        x.sort(((a, b) => -(p[a] ?? 0) + (p[b] ?? 0)));
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
