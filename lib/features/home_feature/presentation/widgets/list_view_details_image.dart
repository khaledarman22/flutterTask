import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/features/home_feature/presentation/details_cubit/details_cubit.dart';

class Listviewdetailsimage extends StatelessWidget {
  const Listviewdetailsimage({
    super.key,
    required this.cubit,
  });

  final DetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ListView.builder(
        reverse: true,
        itemCount: cubit.detailsModel!.data!.moreImage!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              cubit.getImage(id: index);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(3),
              child: CachedNetworkImage(
                  imageUrl: cubit.image ?? cubit.moreImages![0].image!),
            ),
          );
        },
      ),
    );
  }
}
