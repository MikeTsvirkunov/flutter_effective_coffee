import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String header;
  const CategoryHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          header,
          style: Theme.of(context).textTheme.displayLarge,
        ));
  }
}
