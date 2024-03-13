import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/interfaces/interface_action.dart';
import 'package:flutter_course/src/common/values/functions_container.dart';
import 'package:flutter_course/src/theme/app_colors.dart';

class CategoryTag extends StatefulWidget {
  final String text;
  final Function func;
  final int count;
  const CategoryTag({
    Key? key,
    required this.text,
    required this.func,
    required this.count,
  }) : super(key: key);
  @override
  State<CategoryTag> createState() => _StdInterestTagCheckableState();
}

class _StdInterestTagCheckableState extends State<CategoryTag> {
  late bool selected;
  @override
  void initState() {
    selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        showCheckmark: false,
        backgroundColor:
            selected ? AppColors.checkoutButtonColor : AppColors.white,
        disabledColor: AppColors.white,
        selectedColor: AppColors.checkoutButtonColor,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        selected: widget.count != 0,
        onSelected: (bool s) {
          setState(() {
            widget.func(widget.count == 0);
          });
          if (widget.count == 0)
            ContainerExtractor.extract<ActionInterface>(
              functionsContainer,
              'ScrollTabContainer.ScrollToSubcategoryAction',
            ).action(ConstantContainer({'category': widget.text}));
        },
        label: Text(
          widget.text,
          style: TextStyle(
            color: (widget.count != 0 ? Colors.white : Colors.black),
          ),
        ));
  }
}
