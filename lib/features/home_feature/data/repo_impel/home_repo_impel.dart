import 'package:dio/dio.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertask/core/utils/api/api_service.dart';
import 'package:fluttertask/features/home_feature/data/models/home_prodacts/home_prodacts.dart';
import 'package:fluttertask/features/home_feature/data/repo/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final ApiServes apiServes;
  HomeRepoImpel({
    required this.apiServes,
  });

  @override
  Future<Either<Failure, HomeProdacts>> fetchBeseProdact(
      {required String categoryid}) async {
    try {
      var data = await apiServes.post(
          endpoint: '/client/CategoryProduct',
          data: {'category_id': categoryid});
      return right(HomeProdacts.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        try {
          return left(ServerFailure(e.response!.data['message'].toString()));
        } catch (e) {
          return left(ServerFailure(e.toString()));
        }
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
