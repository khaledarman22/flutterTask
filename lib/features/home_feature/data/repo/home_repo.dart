import 'package:dartz/dartz.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:fluttertask/features/home_feature/data/models/home_prodacts/home_prodacts.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeProdacts>> fetchBeseProdact({
    required String categoryid,
  });
}
