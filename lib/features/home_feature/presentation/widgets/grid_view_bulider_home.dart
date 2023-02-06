// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:fluttertask/features/home_feature/data/models/home_prodacts/home_prodacts.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/item_grid_view_cosnt.dart';

class GridViewBiuilder extends StatelessWidget {
  const GridViewBiuilder({
    Key? key,
    required this.mediaQueryData,
    required this.product,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;
  final HomeProdacts product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (mediaQueryData.orientation == Orientation.portrait) ? 2 : 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: .57),
      itemCount: product.data!.product!.length,
      itemBuilder: (context, index) {
        // log('this is id ${product.data!.product![index].id}');
        return ItemGredViewConst(
          id: '${product.data!.product![index].id}',
          prodact: product.data!.product![index],
        );
      },
    );
  }
}
