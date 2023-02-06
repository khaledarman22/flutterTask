import 'package:flutter/material.dart';
import 'package:fluttertask/features/home_feature/presentation/details_cubit/details_cubit.dart';

class SizeDetails extends StatelessWidget {
  const SizeDetails({
    super.key,
    required this.mediaQueryData,
    required this.cubit,
  });
  final MediaQueryData mediaQueryData;
  final DetailsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width * .5 - 10,
      height: 30,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: cubit.detailsModel!.data!.color![0].size!.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                cubit.getSize(index: index);
              },
              child: Container(
                width: 31,
                height: 31,
                color: cubit.selectSize == index
                    ? Colors.blue
                    : Colors.transparent,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(2),
                  child: Text(cubit
                      .detailsModel!.data!.color![0].size![index].name
                      .toString()),
                ),
              ));
        },
      ),
    );
  }
}
