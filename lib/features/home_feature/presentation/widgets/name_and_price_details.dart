import 'package:flutter/material.dart';
import 'package:fluttertask/features/home_feature/presentation/details_cubit/details_cubit.dart';

class NameAndPriceDetails extends StatelessWidget {
  const NameAndPriceDetails({
    super.key,
    required this.mediaQueryData,
    required this.cubit,
  });

  final MediaQueryData mediaQueryData;
  final DetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: mediaQueryData.size.width * .3 - 10,
            child: Text(
              '${cubit.detailsModel!.data!.price!}\$',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 15, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(
            width: mediaQueryData.size.width * .7 - 10,
            child: Text(
              cubit.detailsModel!.data!.name!,
              maxLines: 3,
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
