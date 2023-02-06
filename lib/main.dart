// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertask/core/cache_helper.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:fluttertask/features/auth_feature/presentation/view/login_screen.dart';
import 'package:fluttertask/features/home_feature/presentation/home_cubit/home_cubit.dart';
import 'package:fluttertask/features/home_feature/presentation/view/home_screen.dart';

import 'core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  await CacheHelper.init();
  String? isLogin = CacheHelper.getCachedData(key: 'token');

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.isLogin,
  }) : super(key: key);
  final String? isLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(authRepoImpel: sl()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(authRepoImpel: sl()),
        ),
        BlocProvider(
            create: (context) =>
                HomeCubit(homeRepoImpel: sl())..feachHomeData()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: isLogin == null ? LoginScreen() : const HomeScreen()),
    );
  }
}
