import 'package:flutter/material.dart';
import 'package:fluttertask/features/home_feature/presentation/details_cubit/details_cubit.dart';

class ColorsDetails extends StatelessWidget {
  const ColorsDetails({
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
        scrollDirection: Axis.horizontal,
        itemCount: cubit.moreImages!.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                cubit.getImage(id: index);
                cubit.getColor(index: index);

                // cubit.getSize(id: index, hex: cubit.moreImages![index].hex!);
              },
              child: Stack(
                alignment: FractionalOffset.center,
                children: [
                  Container(
                    // margin: EdgeInsets.all(2),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cubit.selectColor == index
                            ? Colors.blue
                            : Colors.transparent),
                  ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(int.parse(
                            '0xFF${cubit.moreImages![index].hex ?? '000000'}'))),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
