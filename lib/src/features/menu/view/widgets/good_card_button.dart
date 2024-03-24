import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/values/texts_container.dart';
import 'package:flutter_course/src/theme/app_colors.dart';

class GoodCardButton extends StatefulWidget {
  final String goodID;
  final String price;
  const GoodCardButton({super.key, required this.goodID, required this.price});

  @override
  State<GoodCardButton> createState() => _GoodCardButtonState();
}

class _GoodCardButtonState extends State<GoodCardButton> {
  late int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var defaultButton = IconButton(
      onPressed: () {
        setState(() {
          count += 1;
        });
      },
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
          color: AppColors.checkoutButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          '${widget.price} ${ContainerExtractor.extract<String>(textsContainer, 'price_measure')}',
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
            count -= 1;
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
            '$count',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        IconButton(
          onPressed: () => setState(() {
            count += 1;
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
    return count == 0 ? defaultButton : checkedButton;
  }
}
