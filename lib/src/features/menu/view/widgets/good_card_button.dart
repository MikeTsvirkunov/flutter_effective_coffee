import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/values/texts_container.dart';
import 'package:flutter_course/src/features/buck/bloc/buck_model.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:provider/provider.dart';

class GoodCardButton extends StatefulWidget {
  final GoodModel goodModel;
  const GoodCardButton({
    super.key,
    required this.goodModel,
  });

  @override
  State<GoodCardButton> createState() => _GoodCardButtonState();
}

class _GoodCardButtonState extends State<GoodCardButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BuckModel>(
      builder: (BuildContext context, BuckModel value, Widget? child) {
        var defaultButton = IconButton(
          onPressed: () {
            setState(() {
              value.updateBucket(
                widget.goodModel,
                (value.goodsInBuck[widget.goodModel] ?? 0) + 1,
              );
            });
          },
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: AppColors.checkoutButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              '${widget.goodModel.priece} ${ContainerExtractor.extract<String>(textsContainer, 'price_measure')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        );
        var checkedButton = Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => setState(() {
                value.updateBucket(
                  widget.goodModel,
                  (value.goodsInBuck[widget.goodModel] ?? 1) - 1,
                );
              }),
              icon: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.checkoutButtonColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.remove,
                    color: AppColors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
            Container(
              width: 52,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.checkoutButtonColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                '${value.goodsInBuck[widget.goodModel]}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                value.updateBucket(
                  widget.goodModel,
                  (value.goodsInBuck[widget.goodModel] ?? 0) + 1,
                );
              }),
              icon: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.checkoutButtonColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        );
        return (value.goodsInBuck[widget.goodModel] ?? 0) == 0
            ? defaultButton
            : checkedButton;
      },
    );
  }
}
