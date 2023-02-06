import 'package:dartz/dartz.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:fluttertask/features/home_feature/data/models/details_model/details_model.dart';

abstract class DetailsRepo {
  Future<Either<Failure, DetailsModel>> fetchDetailsProdact({
    required String productId,
  });
}
