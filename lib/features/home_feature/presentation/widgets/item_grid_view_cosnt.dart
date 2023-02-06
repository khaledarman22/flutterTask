// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:fluttertask/features/home_feature/data/models/home_prodacts/product.dart';
import 'package:fluttertask/features/home_feature/presentation/view/details_items.dart';

class ItemGredViewConst extends StatelessWidget {
  const ItemGredViewConst({
    Key? key,
    required this.prodact,
    required this.id,
  }) : super(key: key);
  final Product prodact;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsItemScreen(
              id: id,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 20.0,
        child: LayoutBuilder(
          builder: (contex, p1) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * .7,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: '${prodact.image}',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: p1.maxWidth,
                  height: p1.maxHeight * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${prodact.name}',
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
                      Text(
                        '${prodact.price}+\$',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
