// import 'package:booklyapp/core/utils/api/api_serves.dart';
// import 'package:booklyapp/features/home_featuer/data/reposetory/home_repo_impl.dart';
// import 'package:booklyapp/features/home_featuer/presentation/cubit/home_feature_cubit.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:fluttertask/core/utils/api/api_service.dart';
import 'package:fluttertask/features/auth_feature/data/repo_impel/auth_repo_impel.dart';
import 'package:fluttertask/features/home_feature/data/repo_impel/details_repo_impel.dart';
import 'package:fluttertask/features/home_feature/data/repo_impel/home_repo_impel.dart';

final sl = GetIt.instance;

class ServiceLocator {
  init() {
    sl.registerLazySingleton(() => ApiServes(sl()));
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => AuthRepoImpel(apiServes: sl()));
    sl.registerLazySingleton(() => HomeRepoImpel(apiServes: sl()));
    sl.registerLazySingleton(() => DetailsRepoImpel(apiServes: sl()));
  }
}
