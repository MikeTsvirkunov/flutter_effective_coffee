import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/container_extractor.dart';
import 'package:flutter_course/src/common/values/text_styles_container.dart';
import 'package:flutter_course/src/features/menu/view/widgets/good_card_button.dart';

class GoodCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String price;
  const GoodCard({
    super.key,
    required this.name,
    required this.imageUrl,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
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
