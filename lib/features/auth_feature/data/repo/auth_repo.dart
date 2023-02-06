import 'package:dartz/dartz.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:fluttertask/features/auth_feature/data/models/auth_model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> baseRegaster({
    required String email,
    required String passwordConfirmation,
    required String mobile,
    required String name,
    required String password,
  });
  Future<Either<Failure, AuthModel>> baseLogin({
    required String mobile,
    required String password,
  });
}
