import 'package:flutter/material.dart';
import 'package:flutter_course/src/common/containers/constant_container.dart';
import 'package:flutter_course/src/common/network/post_order_strategy.dart';
import 'package:flutter_course/src/features/buck/bloc/buck_model.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class BucketPanel extends StatefulWidget {
  const BucketPanel({super.key});

  @override
  State<BucketPanel> createState() => _BucketPanelState();
}

class _BucketPanelState extends State<BucketPanel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuckModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Ваш заказ',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          actions: [
            IconButton(
              onPressed: () {
                value.clearBucket();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: value.goodsInBuck.length + 1,
          itemBuilder: (context, index) => index == value.goodsInBuck.length
              ? const SizedBox(
                  height: 140,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                          image: NetworkImage(
                            value.goodsInBuck.keys.elementAt(index).imageUrl,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      value.goodsInBuck.keys.elementAt(index).name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Text(
                      '${value.goodsInBuck.keys.elementAt(index).priece} ${value.goodsInBuck.keys.elementAt(index).currency}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: () async {
              var x = await PostOrderStrategy()
                  .execute<Response>(ConstantContainer({'buck': value}));

              final snackBar = SnackBar(
                duration: Duration(seconds: 2),
                content: Text(x.statusCode == 201 ? 'Success' : 'Bad'),
              );
              if (x.statusCode == 201) value.clearBucket();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(
                Color(0xFF85C3DE),
              ),
            ),
            icon: const SizedBox(
              height: 30,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  'Оформить заказ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
