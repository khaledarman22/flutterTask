import 'package:dio/dio.dart';
import 'package:fluttertask/core/utils/api/api_service.dart';
import 'package:fluttertask/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertask/features/auth_feature/data/models/auth_model/auth_model.dart';
import 'package:fluttertask/features/auth_feature/data/repo/auth_repo.dart';

class AuthRepoImpel implements AuthRepo {
  final ApiServes apiServes;
  AuthRepoImpel({
    required this.apiServes,
  });
  @override
  Future<Either<Failure, AuthModel>> baseRegaster({
    required String email,
    required String passwordConfirmation,
    required String mobile,
    required String name,
    required String password,
  }) async {
    try {
      var data = await apiServes.post(
        endpoint: "/register",
        data: {
          'name': name,
          'mobile': mobile,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation
        },
      );
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        // print(e.response!.data['message'].toString());
        return left(ServerFailure(e.response!.data['message'].toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> baseLogin({
    required String mobile,
    required String password,
  }) async {
    try {
      var data = await apiServes.post(
        endpoint: "/login",
        data: {
          'mobile': mobile,
          'password': password,
        },
      );
      return right(AuthModel.fromJson(data));
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
