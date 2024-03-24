import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/bloc/good_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/good_card_button.dart';

class GoodCard extends StatelessWidget {
  final GoodModel goodModel;
  const GoodCard({
    super.key,
    required this.goodModel,
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
                  image: NetworkImage(goodModel.imageUrl),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(goodModel.name, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(
            height: 16,
          ),
          GoodCardButton(
            goodModel: goodModel,
          ),
        ],
      ),
    );
  }
}
