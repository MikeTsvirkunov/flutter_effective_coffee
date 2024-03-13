import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/values/text_styles_container.dart';
import 'package:flutter_course/src/features/menu/view/widgets/good_card_button.dart';

class GoodCard extends StatelessWidget {
  final String id;
  final String name;
  final Uint8List image;
  final String price;
  const GoodCard({
    super.key,
    required this.name,
    required this.image,
    required this.id,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.memory(
            image,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(name, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(
            height: 16,
          ),
          GoodCardButton(
            goodID: id,
            price: price,
          )
        ],
      ),
    );
  }
}
