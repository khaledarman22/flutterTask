// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/core/functions/get_device_type.dart';
import 'package:fluttertask/core/utils/enums/device_type.dart';
import 'package:fluttertask/core/widgets/const_appbar.dart';
import 'package:fluttertask/core/widgets/const_drawer.dart';
import 'package:fluttertask/core/widgets/const_loding_circul.dart';
import 'package:fluttertask/features/home_feature/presentation/home_cubit/home_cubit.dart';
import 'package:fluttertask/features/home_feature/presentation/widgets/grid_view_bulider_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      drawer: ConstDrawer(mediaQueryData: mediaQueryData),
      appBar: constAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeStateErorr) {
            return Center(
              child: Text(state.errorMassage),
            );
          }
          if (state is HomeStateLoding) {
            return const LodingCircul();
          }
          if (state is HomeStateLoded) {
            return getDeviceType(mediaQueryData) == DeviceType.mobile
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridViewBiuilder(
                        mediaQueryData: mediaQueryData,
                        product: state.Prodacts),
                  )
                : const Scaffold();
          }
          return const Scaffold();
        },
      ),
    );
  }
}
