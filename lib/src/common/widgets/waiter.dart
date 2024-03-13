import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/interfaces/interface_strategy.dart';

class Waiter extends StatefulWidget {
  final Future<dynamic> future;
  final StrategyInterface strategySnapshotProcessor;
  final StrategyInterface childBuilder;
  const Waiter({
    super.key,
    required this.childBuilder,
    required this.future,
    required this.strategySnapshotProcessor,
  });

  @override
  State<Waiter> createState() => _WaterState();
}

class _WaterState extends State<Waiter> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) =>
          widget.strategySnapshotProcessor.execute<Widget>(
        ConstantContainer({
          'child_builder': widget.childBuilder,
          'snapshot': snapshot,
        }),
      ),
    );
  }
}
