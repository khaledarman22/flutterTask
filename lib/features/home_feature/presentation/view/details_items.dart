import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/core/services_locator/services_locator.dart';
import 'package:fluttertask/core/widgets/const_drawer.dart';
import 'package:fluttertask/core/widgets/const_loding_circul.dart';
import 'package:fluttertask/features/home_feature/presentation/details_cubit/details_cubit.dart';
import 'package:fluttertask/core/widgets/const_appbar.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/color_details.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/list_view_details_image.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/name_and_price_details.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/size_details.dart';

class DetailsItemScreen extends StatelessWidget {
  const DetailsItemScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(detailsRepoImpel: sl())
        ..fetchDetailsProdact(productId: id.toString(), context: context),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          DetailsCubit cubit = DetailsCubit.get(context);
          if (cubit.detailsModel != null) {
            return Scaffold(
              appBar: constAppBar(title: Text(cubit.detailsModel!.data!.name!)),
              drawer: ConstDrawer(mediaQueryData: MediaQuery.of(context)),
              body: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .6,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              cubit.image ?? cubit.moreImages![0].image!),
                        )),
                    child: Listviewdetailsimage(cubit: cubit),
                  ),
                  NameAndPriceDetails(
                      mediaQueryData: MediaQuery.of(context), cubit: cubit),
                  Row(
                    children: [
                      ColorsDetails(
                          mediaQueryData: MediaQuery.of(context), cubit: cubit),
                      SizeDetails(
                          mediaQueryData: MediaQuery.of(context), cubit: cubit),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Scaffold(
            body: LodingCircul(),
          );
        },
      ),
    );
  }
}
