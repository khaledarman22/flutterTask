import 'package:dio/dio.dart';
import 'package:fluttertask/core/utils/api/api_service.dart';
import 'package:fluttertask/features/home_feature/data/models/details_model/details_model.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertask/features/home_feature/data/repo/details_repo.dart';

class DetailsRepoImpel implements DetailsRepo {
  final ApiServes apiServes;
  DetailsRepoImpel({
    required this.apiServes,
  });

  @override
  Future<Either<Failure, DetailsModel>> fetchDetailsProdact({
    required String productId,
  }) async {
    try {
      var data = await apiServes
          .post(endpoint: '/client/Product', data: {'product_id': productId});
      return right(DetailsModel.fromJson(data));
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
